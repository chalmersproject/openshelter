# typed: strict
# frozen_string_literal: true

class ApiController < ApplicationController
  extend T::Sig

  sig { void }
  def show
    payload = {
      version: app.version,
      csrf_param: request_forgery_protection_token.to_s,
      csrf_token: form_authenticity_token,
    }
    render(json: payload)
  end
end
