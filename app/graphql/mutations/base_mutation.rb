# typed: strict
# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    extend T::Sig

    include ResolverHelpers

    object_class Types::BaseObject
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    argument_class Types::BaseArgument

    resolve_method :resolve_wrapper

    sig { params(args: T.untyped).returns(T.untyped) }
    def resolve_wrapper(**args)
      ActiveRecord::Base.transaction do
        return_value = args.any? ? resolve(**args) : resolve
        return_value.is_a?(T::Struct) ? return_value.serialize : return_value
      end
    end

    sig do
      params(
          args: T.untyped,
          kwargs: T.untyped,
          block: T.nilable(T.proc.bind(Types::BaseField).void),
        )
        .returns(T.untyped)
    end
    def self.field(*args, **kwargs, &block)
      super
    end
  end
end
