# typed: true
# frozen_string_literal: true

class ShelterSignalFormComponent < ApplicationComponent
  extend T::Sig

  sig { params(signal: ShelterSignal, kwargs: T.untyped).void }
  def initialize(signal:, **kwargs)
    super(**kwargs)
    @signal = signal
  end

  private

  sig { returns(ShelterSignal) }
  attr_reader :signal

  delegate :new_record?, to: :signal
end
