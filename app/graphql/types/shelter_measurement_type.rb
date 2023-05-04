# frozen_string_literal: true

module Types
  class ShelterMeasurementType < Types::BaseObject
    field :id, ID, null: false
    field :type, String, null: false
    field :value, Integer, null: false
    field :shelter_id, Types::UuidType, null: false
    field :signal_id, Types::UuidType, null: false
    field :created_at, Types::TimestamptzType, null: false
  end
end
