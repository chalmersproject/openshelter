# typed: strict
# frozen_string_literal: true

class ShelterFormComponent < ApplicationComponent
  extend T::Sig

  sig { params(shelter: Shelter, kwargs: T.untyped).void }
  def initialize(shelter:, **kwargs)
    super(**kwargs)
    @shelter = shelter
  end

  private

  sig { returns(Shelter) }
  attr_reader :shelter

  delegate :new_record?, to: :shelter
end
