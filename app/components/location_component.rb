# typed: true
# frozen_string_literal: true

class LocationComponent < ApplicationComponent
  extend T::Sig

  sig do
    params(location: T.untyped, interactive: T::Boolean, kwargs: T.untyped).void
  end
  def initialize(location:, interactive: false, **kwargs)
    super(**kwargs)
    @location = location
    @interactive = interactive
  end

  private

  sig { returns(T.untyped) }
  attr_reader :location

  sig { returns(T::Boolean) }
  def interactive?
    @interactive
  end
end
