# typed: strict
# frozen_string_literal: true

module Types
  class ShelterType < Types::BaseObject
    global_id_field :id

    field :created_at, Types::DateTimeType, null: false
    field :updated_at, Types::DateTimeType, null: false

    field :name, String, null: false

    field :email, String
    field :phone, String

    field :address, String
  end
end
