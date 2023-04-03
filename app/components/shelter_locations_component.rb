# typed: strict
# frozen_string_literal: true

class ShelterLocationsComponent < ApplicationComponent
  extend T::Sig

  sig do
    params(shelters: T::Enumerable[Shelter], interactive: T::Boolean, kwargs: T.untyped).void
  end
  def initialize(shelters:, interactive: false, **kwargs)
    super(**kwargs)
    @shelters = shelters
    @interactive = interactive
  end

  private

  sig{ returns(T::Array[T::Hash[String,T.untyped]]) }
  def shelters
    @shelters.map do |shelter|
      {
        "id" => shelter.id,
        "location" => RGeo::GeoJSON.encode(shelter.location),
        "popupFrameId" => [dom_id(shelter), "popup"].join("_"),
        "popupFrameUrl" => popup_shelter_path(shelter).tap { |popup_path| puts( ["POPUP PATH: ", popup_path])}
      }
    end
  end

  sig { returns(T::Boolean) }
  def interactive?
    @interactive
  end
end
