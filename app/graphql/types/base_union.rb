# typed: strict
# frozen_string_literal: true

module Types
  class BaseUnion < GraphQL::Schema::Union
    edge_type_class BaseEdge
    connection_type_class BaseConnection
  end
end
