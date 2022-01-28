# typed: strict
# frozen_string_literal: true

class ApiController < ApplicationController
  extend T::Sig

  sig { void }
  def show
    payload = { version: application.version }
    render(json: JSON.pretty_generate(payload))
  end
end
