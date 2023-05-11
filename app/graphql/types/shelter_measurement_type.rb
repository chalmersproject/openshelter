# typed: false
# frozen_string_literal: true

module Types
  class ShelterMeasurementType < Types::BaseObject
    field :id, ID, null: false
    field :type, String, null: false
    field :value, Integer, null: false
    field :shelter_id, ID, null: false
    field :signal_id, ID, null: false
    field :created_at, String, null: false
  end
end
