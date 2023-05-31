# typed: false
# frozen_string_literal: true

class ApiKeysController < ApplicationController
  include ApiKeyAuthenticatable

  # require API key authentication for index of API keys
  prepend_before_action :authenticate_with_api_key!, only: [:index]

  # optional api key authentication for logout
  prepend_before_action :authenticate_with_api_key, only: [:destory]

  #
  # only admins should be able to create api keys
  #
  before_action :authenticate_user!, only: %i[index destroy create]

  before_action :set_api_key, only: %i[destroy]

  def index

  end

  def new
    logger.debug("Shelter Signal ID: #{params[:shelter_signal]}")
    @api_key = ApiKey.new
    @shelter_signal = ShelterSignal.find(params[:shelter_signal])
    logger.debug("New api_key: #{@api_key}")
    logger.debug("DOM ID: #{@api_key.id}")
    # respond_to do |format|
    #   format.turbo_stream
    # end
    # respond_with(@api_key, layout: false, locals: {api_key: @api_key})
  end

  def create
    @api_key = ApiKey.create!(token: SecureRandom.hex)
  end

  # def destroy
  # end
  def destroy
    @api_key.destroy
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  # == Helpers ==
  sig { returns(ActionController::Parameters) }
  def api_key_params
    signal = T.cast(params.require(:shelter_signal), ActionController::Parameters)
    signal.permit(:type, :shelter_id)
  end

  def set_api_key
    @api_key = ApiKey.find(params[:id])
  end
end
