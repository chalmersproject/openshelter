# typed: true
# frozen_string_literal: true

class ShelterLocationsComponent < ApplicationComponent
  extend T::Sig

  sig do
    params(shelters: T::Enumerable[Shelter], userAgent: String, interactive: T::Boolean,
kwargs: T.untyped).void
  end
  def initialize(shelters:, interactive: false, userAgent:, **kwargs)
    super(**kwargs)
    @shelters = shelters
    @interactive = interactive
    @userAgent = userAgent
  end

  private

  sig{ returns(T::Array[T::Hash[String,T.untyped]]) }
  def shelters
    @shelters.map do |shelter|
      {
        "id" => shelter.id,
        "location" => RGeo::GeoJSON.encode(shelter.location),
        "popupFrameId" => [dom_id(shelter), "popup"].join("_"),
        "popupFrameUrl" => popup_shelter_path(shelter),
        "markerFrameId" => [dom_id(shelter), "marker"].join("_"),
        "markerFrameUrl" => marker_shelter_path(shelter)
      }
    end
  end

  sig { returns(T::Boolean) }
  def interactive?
    @interactive
  end

  sig { returns(String) }
  def userAgent?
    @userAgent
  end
end
