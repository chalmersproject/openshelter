# frozen_string_literal: true

module Types
  class ShelterType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :address, String, null: false
    field :slug, String, null: false
    field :contact_email, String
    field :contact_phone, String, null: false
    field :location, Types::GeographyType
    field :tags, String, null: false
    field :website_url, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :images_attachment_ids, String, null: false
    field :max_headcount, Integer, null: false
    field :max_bedcount, Integer, null: false
  end
end
