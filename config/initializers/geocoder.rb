# typed: strict
# frozen_string_literal: true

# prettier-ignore
config = {
  # == Geocoding ==
  lookup: :nominatim,
  http_headers: {
    "User-Agent" => "Chalmers Project Team <hulloitskai@gmail.com>",
  },
  use_https: true,
  # timeout: 3,            # geocoding service timeout (secs)
  # ip_lookup: :ipinfo_io, # name of IP address geocoding service (symbol)
  # language: :en,         # ISO-639 language code
  # http_proxy: nil,       # HTTP proxy server (user:pass@host:port)
  # https_proxy: nil,      # HTTPS proxy server (user:pass@host:port)
  # cache: nil,            # cache object (must respond to #[], #[]=, and #del)

  # == Exceptions ==
  # Exceptions that should not be rescued by default (if you want to implement
  # custom error handling):
  # supports SocketError and Timeout::Error
  # always_raise: [],

  # == Calculation ==
  units: :km,
  distances: :spherical,

  # == Cache ==
  cache_options: {
    expiration: 2.days,
    prefix: "geocoder:",
  },
}

# Use Google if GOOGLE_API_KEY variable is present.
# google_api_key = ENV["GOOGLE_API_KEY"]
# if google_api_key.present?
#   config[:lookup] = :google
#   config[:api_key] = google_api_key
# end

Geocoder.configure(config)
