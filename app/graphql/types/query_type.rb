# typed: strict
# frozen_string_literal: true

module Types
  class QueryType < BaseObject
    extend T::Sig

    # Add node and nodes field.
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :version, String, description: "Application server version."

    field :viewer,
          UserType,
          description: "The currently authenticated user.",
          resolver_method: :current_user

    # TODO: remove me
    field :test_field, String, null: false
    field :test_signal_type, SignalTypeType, null: false

    delegate :version, to: :app

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
