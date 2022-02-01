# typed: strict
# frozen_string_literal: true

module Types
  class BaseObject < GraphQL::Schema::Object
    extend T::Sig

    include ResolverHelpers

    connection_type_class BaseConnection
    edge_type_class BaseEdge
    field_class BaseField
  end
end
