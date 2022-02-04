# typed: strict
# frozen_string_literal: true

class MetaController < ApplicationController
  extend T::Sig

  sig { void }
  def show
    render(json: { version: app.version })
  end
end
