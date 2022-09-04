# typed: true
# frozen_string_literal: true

class FlashComponent < ApplicationComponent
  extend T::Sig

  sig { returns(T::Boolean) }
  def render?
    flash?
  end
end
