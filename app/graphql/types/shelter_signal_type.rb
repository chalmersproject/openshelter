# frozen_string_literal: true

module Types
  class ShelterSignalType < Types::BaseObject
    field :id, ID, null: false
    field :type, String, null: false
    field :shelter_id, Types::UuidType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
