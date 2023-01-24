# typed: strict
# frozen_string_literal: true

class MapsController < ApplicationController
  extend T::Sig
  sig do
    returns(T.untyped)
  end

  def show
    @shelters = T.let(Shelter.all, T.untyped)
  end
end
