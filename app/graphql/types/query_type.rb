# typed: strict
# frozen_string_literal: true

module Types
  class QueryType < BaseObject
    extend T::Sig

    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field,
          String,
          null: false,
          description: "An example field added by the generator"

    field :test_signal_type, SignalTypeType, null: false

    sig { returns(String) }
    def test_field
      "Hello World!"
    end

    sig { returns(SignalType) }
    def test_signal_type
      ::SignalType::Bed
    end
  end
end
