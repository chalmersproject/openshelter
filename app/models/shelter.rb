# typed: strict
# frozen_string_literal: true

# == Schema Information
#
# Table name: shelters
#
#  id                    :uuid             not null, primary key
#  address               :string           not null
#  contact_email         :string
#  contact_phone         :string           not null
#  images_attachment_ids :string           default([]), not null, is an Array
#  location              :geography        geometry, 4326
#  name                  :string           not null
#  slug                  :string           not null
#  tags                  :string           default([]), not null, is an Array
#  website_url           :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_shelters_on_contact_email  (contact_email) UNIQUE
#  index_shelters_on_contact_phone  (contact_phone) UNIQUE
#  index_shelters_on_slug           (slug) UNIQUE
#

class Shelter < ApplicationRecord
  TORONTO_BOUNDS =
    T.let([[43.855275, -79.639327], [43.581653, -79.117202]], T.untyped)

  # == Associations ==
  has_rich_text :about
  has_many :signals, class_name: "ShelterSignal", dependent: :destroy
  has_many :measurements, class_name: "ShelterMeasurement", dependent: :destroy

  # == Validations: Contact ==
  validates :contact_phone,
            presence: true,
            length: {
              maximum: 100,
            },
            phone: true,
            uniqueness: true
  validates :contact_email,
            length: {
              maximum: 100,
            },
            email: true,
            uniqueness: {
              case_sensitive: false,
            },
            allow_nil: true

  # == Validations ==
  validates :address, presence: true
  validates :location, presence: true
  validates :website_url,
            url: {
              no_local: true,
              public_suffix: true,
            },
            allow_nil: true

  # == Callbacks ==
  before_validation :set_location, if: %i[address? address_changed?]

  # == Concerns ==
  include Identifiable
  include Galleryable
  include ::Named
  include Routable
  include Slugged
  include Tagged

  # == Setters ==
  sig { override.params(value: String).returns(String) }
  def address=(value)
    super(value.strip)
  end

  sig { override.params(value: T.nilable(String)).returns(T.nilable(String)) }
  def contact_email=(value)
    super(value&.strip&.downcase.presence)
  end

  sig { override.params(value: T.nilable(String)).returns(T.nilable(String)) }
  def website_url=(value)
    super(value&.strip&.downcase.presence)
  end

  # == Methods ==
  sig { returns(String) }
  def google_maps_directions_url
    url = Addressable::URI.parse("https://www.google.com/maps/dir/")
    url.query_values = {
      "api" => 1,
      "origin" => "Moss Park, Toronto, ON, Canada",
      "destination" => address,
      "travelmode" => "walking",
    }
    url.to_s
  end

  #
  # takes in "type" of shelter signal measurement
  # returns the most recent measurement of that type for this shelter

  sig { params(type: String).returns(T.nilable(ShelterMeasurement)) }
  def last_measurements(type:)
    measurements.where(type: type).chronological.last
  end

  private

  # == Callbacks ==
  sig { void }
  def set_location
    result = geocode
    if result
      lat, lon = T.cast(result.coordinates, [Float, Float])
      self.location = location_factory.point(lon, lat)
    else
      errors.add(
        :address,
        :invalid,
        message: "does not describe a known location",
      )
    end
  end

  # == Helpers ==
  sig { returns(T.nilable(Geocoder::Result::Base)) }
  def geocode
    results =
      T.let(
        if Geocoder.config[:lookup] == :google
          Geocoder.search(address, bounds: TORONTO_BOUNDS)
        else
          Geocoder.search(address, params: { countrycodes: "ca" })
        end,
        T::Array[Geocoder::Result::Base],
      )
    best_result =
      case Geocoder.config[:lookup]
      when :nominatim
        results = T.cast(results, T::Array[Geocoder::Result::Nominatim])
        building = results.find { |result| result.place_class == "building" }
        building
      end
    best_result || results.first
  end

  sig { returns(RGeo::Geographic::Factory) }
  def location_factory
    Shelter.attribute_types["location"].spatial_factory
  end
end

# == FriendlyId ==
class Shelter
  include FriendlyId::Concern

  friendly_id :name
end
