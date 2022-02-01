# typed: strict
# frozen_string_literal: true

class MetaController < ApplicationController
  extend T::Sig

  sig { void }
  def show
    csrf = { request_forgery_protection_token => form_authenticity_token }
    render(json: { version: app.version, csrf: csrf })
  end
end
