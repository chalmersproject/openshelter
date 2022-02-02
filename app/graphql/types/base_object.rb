# typed: strict
# frozen_string_literal: true

module Types
  class BaseObject < GraphQL::Schema::Object
    extend T::Sig

    include ResolverHelpers

    field_class BaseField
    connection_type_class BaseConnection
    edge_type_class BaseEdge

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
