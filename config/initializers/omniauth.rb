# typed: true
# frozen_string_literal: true

require "omniauth_ext"

OmniAuth.configure do |config|
  uri =
    Addressable::URI.new(
      scoped do
        options = Rails.application.routes.default_url_options.dup
        options[:scheme] = options.delete(:protocol)
        options
      end,
    )
  config.full_host = uri.to_s
end
