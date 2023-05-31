# typed: true
# frozen_string_literal: true

class ShelterSignalsController < ApplicationController
  extend T::Sig

  # == Filters ==
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_signal, only: %i[new_api_key create_api_key destroy_api_key
                                      show edit update destroy]

  # == Actions ==
  def index
    authorize!
    @signals = ShelterSignal.all
    respond_with(@signals)
  end

  def show
    @signal = T.must(@signal)

    if admin?
      @api_keys = @signal.api_keys
    end

    authorize!(@signal)
    respond_with(@signal)
  end

  def new
    authorize!
    @signal = ShelterSignal.new
    respond_with(@signal, location: ShelterSignal)
  end

  def edit
    @signal = T.must(@signal)
    authorize!(@signal)
  end

  def create
    @signal = ShelterSignal.create(signal_params)
    authorize!(@signal)
    # binding.pry
    respond_with(@signal)
  end

  def new_api_key
    @api_key = ApiKey.new
    @signal = T.must(@signal)
  end

  def create_api_key
    @signal = T.must(@signal)
    @api_key = ApiKey.new(api_key_params)
    if admin?
      @signal = T.must(@signal)
      @signal.api_keys.create!(token: SecureRandom.hex,
                                name: api_key_params["name"])

      if @signal.api_key.save
        respond_to do |format|
          format.html do
            redirect_to quotes_path, notice: "API KEY was succesfully created"
          end
          format.turbo_stream
        end
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def destroy_api_key
  end

  def update
    @signal = T.must(@signal)
    authorize!(@signal)
    @signal.update(signal_params)
    respond_with(@signal)
  end

  def destroy
    @signal = T.must(@signal)
    authorize!(@signal)
    @signal.destroy
    respond_with(@signal)
  end

  private

  # == Filters ==
  def set_signal
    @signal = ShelterSignal.find(params[:id])
  end

  # == Helpers ==
  sig { returns(ActionController::Parameters) }
  def signal_params
    signal = T.cast(params.require(:shelter_signal), ActionController::Parameters)
    signal.permit(:type, :shelter_id)
  end

  sig { returns(ActionController::Parameters) }
  def api_key_params
    api_key = T.cast(params.require(:api_key), ActionController::Parameters)
    api_key.permit(:name)
  end
end
