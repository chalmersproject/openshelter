# typed: true
# frozen_string_literal: true

class SheltersController < ApplicationController
  extend T::Sig

  # == Filters ==
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_shelter, only: %i[show popup edit update destroy]

  # == Actions ==
  def index
    authorize!
    @shelters = Shelter.all
    respond_with(@shelters)
  end

  def show
    @shelter = T.must(@shelter)
    authorize!(@shelter)
    respond_with(@shelter)
  end

  def popup
    @shelter = T.must(@shelter)
    puts(["Shelter POPUP: ", @shelter.inspect])
    authorize!(@shelter, to: :show?)
    # respond_with(@shelter, layout: false)
    respond_to do |format|
      format.turbo_stream {
        render(turbo_stream: turbo_stream.replace(
          [@shelter.id, "popup"].join("_"),
          "fart"
        ))
        }
    end
  end

  def new
    authorize!
    @shelter = Shelter.new
    respond_with(@shelter, location: Shelter)
  end

  def edit
    @shelter = T.must(@shelter)
    authorize!(@shelter)
  end

  def create
    @shelter = Shelter.create(shelter_params)
    authorize!(@shelter)
    respond_with(@shelter)
  end

  def update
    @shelter = T.must(@shelter)
    authorize!(@shelter)
    @shelter.update(shelter_params)
    respond_with(@shelter)
  end

  def destroy
    @shelter = T.must(@shelter)
    authorize!(@shelter)
    @shelter.destroy
    respond_with(@shelter)
  end

  private

  # == Filters ==
  def set_shelter
    @shelter = T.let(@shelter, T.nilable(Shelter))
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
