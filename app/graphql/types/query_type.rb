# typed: strict
# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    extend T::Sig

    # Add node and nodes field.
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :csrf_token, String, null: false, resolver_method: :resolve_csrf_token
    field :version,
          String,
          null: false,
          description: "Application server version."

    field :viewer,
          Types::UserType,
          description: "The currently authenticated user.",
          resolver_method: :current_user

    # TODO: remove me
    field :test_field, String, null: false
    field :test_signal_type, SignalTypeType, null: false

    sig { returns(String) }
    def resolve_csrf_token
      T.must(csrf_token)
    end

    sig { returns(String) }
    def version # rubocop:disable Rails/Delegate
      app.version
    end

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
