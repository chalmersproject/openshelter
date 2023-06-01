# typed: true
# frozen_string_literal: true

class ShelterSignalsController < ApplicationController
  extend T::Sig

  # == Filters ==
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_signal, only: %i[show edit update destroy]

  # == Actions ==
  def index
    authorize!
    @signals = ShelterSignal.all
    respond_with(@signals)
  end

  def show
    @signal = T.must(@signal)

    if admin?
      @secret_key = @signal.secret_key
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
end
