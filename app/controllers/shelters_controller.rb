# typed: true
# frozen_string_literal: true

class SheltersController < ApplicationController
  extend T::Sig

  # == Filters ==
  before_action :set_shelter, only: %i[show edit update destroy]

  # == Actions ==
  def index
    @shelters = Shelter.all
    respond_with(@shelters)
  end

  def show
    respond_with(@shelter)
  end

  def new
    @shelter = Shelter.new
    respond_with(@shelter, location: Shelter)
  end

  def edit; end

  def create
    @shelter = Shelter.create(shelter_params)
    respond_with(@shelter)
  end

  def update
    @shelter.update(shelter_params)
    respond_with(@shelter)
  end

  def destroy
    @shelter.destroy
    respond_with(@shelter)
  end

  private

  # == Filters ==
  def set_shelter
    @shelter = Shelter.friendly.find(params[:id])
  end

  # == Helpers ==
  sig { returns(ActionController::Parameters) }
  def shelter_params
    shelter = T.cast(params.require(:shelter), ActionController::Parameters)
    shelter.permit(
      :name,
      :slug,
      :location,
      :address,
      :contact_email,
      :contact_phone,
      :website_url,
      :about,
      :images,
      :tags,
      tags: [],
      images: [],
    )
  end
end
