# typed: true
# frozen_string_literal: true

module Types
  class ShelterType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :address, String, null: false
    field :slug, String, null: false
    field :contact_email, String
    field :contact_phone, String, null: false
    field :location, Types::GeoCoordinates, null: false
    field :tags, String, null: false
    field :website_url, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :images_attachment_ids, String, null: false
    field :max_headcount, Integer, null: false
    field :max_bedcount, Integer, null: false

    #
    # return a list of all measurements taken on a shelter
    #
    field :measurements, [Types::ShelterMeasurementType] , null: true do
      argument :id, ID, required: false
      argument :type, ID, required: false
    end
    def measurements(id: nil, type: nil)
      measurements = object.measurements
      unless id.nil?
        measurements = measurements.where(id: id).order("created_at DESC")
      end
      unless type.nil?
        measurements = measurements.where(type: type).order("created_at DESC")
      end
      measurements.order("created_at DESC")
    end

  end
end
