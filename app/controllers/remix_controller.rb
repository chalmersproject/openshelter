# typed: strict
# frozen_string_literal: true

class RemixController < ApplicationController
  extend T::Sig

  include ReverseProxy::Controller

  sig { returns(T.untyped) }
  def proxy
    reverse_proxy(
      "http://localhost:3000",
      headers: {
        "X-CSRF-Param": request_forgery_protection_token.to_s,
        "X-CSRF-Token": form_authenticity_token,
      },
    )
  end
end
