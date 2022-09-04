# typed: strict
# frozen_string_literal: true

class ShelterPolicy < ApplicationPolicy
  extend T::Sig

  # == Rules ==
  sig { returns(T::Boolean) }
  def show?
    true
  end

  private

  # == Helpers ==
  sig { returns(Shelter) }
  def shelter
    T.let(record, Shelter)
  end
end
