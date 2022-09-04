# typed: ignore
# frozen_string_literal: true

begin
  require "searchkick"
rescue LoadError
  return
end

require "tapioca/dsl/helpers/active_record_constants_helper"

module Tapioca
  module Dsl
    module Compilers
      class Searchkick < Compiler
        extend T::Sig

        include Helpers::ActiveRecordConstantsHelper

        ConstantType =
          type_member do
            { fixed: T.all(::ActiveRecord::Base, ::Searchkick::Model) }
          end

        class << self
          extend T::Sig

          sig { override.returns(T::Enumerable[Module]) }
          def gather_constants
            descendants_of(::ActiveRecord::Base)
              .reject(&:abstract_class?)
              .grep(::Searchkick::Model)
          end
        end

        sig { override.void }
        def decorate
          root.create_path(constant) do |model|
            generate_class_methods(model)
            generate_instance_methods(model)
            generate_association_methods(model)
          end
        end

        private

        def generate_class_methods(model)
          model.create_method(
            "search",
            parameters: [
              create_opt_param("term", type: "String", default: "\"*\""),
              create_kw_rest_param("options", type: "T.untyped"),
              create_block_param("block", type: "T.untyped"),
            ],
            return_type: "Searchkick::Relation",
            class_method: true,
          )
          model.create_method(
            "search_index",
            parameters: [
              create_kw_opt_param("name", type: "T.untyped", default: "nil"),
            ],
            return_type: "Searchkick::Index",
            class_method: true,
          )
        end

        def generate_instance_methods(model)
          model.create_method(
            "reindex",
            parameters: [
              create_opt_param(
                "method_name",
                type: "T.untyped",
                default: "nil",
              ),
              create_kw_opt_param(
                "mode",
                type: "T.nilable(Symbol)",
                default: "nil",
              ),
              create_kw_opt_param(
                "refresh",
                type: "T::Boolean",
                default: false,
              ),
            ],
          )
          model.create_method(
            "similar",
            parameters: [create_kw_rest_param("options", type: "T.untyped")],
            return_type: "Searchkick::Relation",
          )
          model.create_method(
            "search_data",
            return_type: "T::Hash[String, T.untyped]",
          )
          model.create_method("should_index?", return_type: "T::Boolean")
        end

        def generate_association_methods(model)
          relations_enabled = compiler_enabled?("ActiveRecordRelations")
          relation_methods_module =
            model.create_module(RelationMethodsModuleName)
          association_relation_methods_module =
            model.create_module(
              AssociationRelationMethodsModuleName,
            ) if relations_enabled
          [relation_methods_module, association_relation_methods_module].compact
            .each do |mod|
            mod.create_method(
              "reindex",
              parameters: [
                create_opt_param(
                  "method_name",
                  type: "T.untyped",
                  default: "nil",
                ),
                create_kw_rest_param("options", type: "T.untyped"),
              ],
              return_type: "T::Boolean",
            )
            model.create_extend(RelationMethodsModuleName)
          end
        end
      end
    end
  end
end
