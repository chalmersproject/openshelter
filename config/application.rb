# typed: strict
# frozen_string_literal: true

require_relative "boot"
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Chalmers
  class Application < Rails::Application
    extend T::Sig

    sig { returns(String) }
    attr_reader :version

    sig { returns(T::Hash[String, T.untyped]) }
    def self.package_json
      path = File.expand_path("../package.json", __dir__)
      hash = JSON.parse(File.read(path))
      raise "Expected package.json to be a JSON object" unless hash.is_a?(Hash)
      hash
    rescue Errno::ENOENT
      raise "Cannot load package.json"
    end

    sig { returns(String) }
    def self.package_version
      hash = Application.package_json

      version = hash.fetch("version")
      unless version.is_a?(String)
        raise "Expected package version to be a string"
      end

      version
    end

    sig { void }
    def initialize
      @version = T.let(self.class.package_version, String)
      super
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults(7.0)

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # Configure sessions
    config.session_store(:cookie_store, key: "session")
    config.middleware.use(ActionDispatch::Cookies)
    config.middleware.use(config.session_store, config.session_options)

    # Configure middleware for Rails Admin
    config.middleware.use(ActionDispatch::Flash)
    config.middleware.use(Rack::MethodOverride)

    # Configure Active Record
    config.active_record.schema_migrations_table_name = "_migrations"
    config.active_record.internal_metadata_table_name = "_metadata"

    # Configure Active Support
    config.active_support.remove_deprecated_time_with_zone_name = true

    # Configure assets
    config.assets.prefix = "/build/assets"

    # Configure logging
    config.colorize_logging = true
  end
end
