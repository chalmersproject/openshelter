# typed: strict
# frozen_string_literal: true

module ApplicationController::Remix
  extend T::Sig
  extend T::Helpers

  include Kernel
  include ReverseProxy::Controller

  sig { void }
  def included
    @remix_url = T.let(nil, T.nilable(String))
  end

  abstract!

  sig { abstract.returns(ActionDispatch::Request) }
  def request; end

  sig { abstract.returns(Symbol) }
  def request_forgery_protection_token; end

  sig { abstract.returns(String) }
  def form_authenticity_token; end

  sig { abstract.params(fallback_location: T.untyped).void }
  def redirect_back_or_to(fallback_location); end

  REMIX_URL = "http://localhost:3100"

  sig { void }
  def proxy
    if Rails.env.development?
      begin
        _proxy(http: { read_timeout: 0.2 })
      rescue Net::ReadTimeout
        # Handle connection reset when Remix reloads after file change.
        redirect_back_or_to(:root)
      end
    else
      _proxy
    end
  end

  private

  sig { params(http: T.nilable(T::Hash[Symbol, T.untyped])).void }
  def _proxy(http: nil)
    _sanitize_method
    require "net/http"
    reverse_proxy(
      REMIX_URL,
      headers: {
        "X-CSRF-Param": request_forgery_protection_token.to_s,
        "X-CSRF-Token": form_authenticity_token,
      },
      http: http,
    )
  end

  sig { void }
  def _sanitize_method
    method = T.let(request.env["REQUEST_METHOD"], T.nilable(String))
    unless %w[GET HEAD OPTIONS].include?(method)
      request.env["REQUEST_METHOD"] = "GET"
    end
  end
end
