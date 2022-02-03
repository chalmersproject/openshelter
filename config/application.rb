# typed: strict
# frozen_string_literal: true

require_relative "boot"
require "rails/all"

# Initialize Railties, etc.
require "sprockets/railtie"
require "good_job/engine"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

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
    raise "Expected package version to be a string" unless version.is_a?(String)

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

  # Don't show full stack traces in responses.
  config.consider_all_requests_local = false

  # Configure cookie sessions.
  config.session_store(:cookie_store, key: "session")
  config.middleware.use(ActionDispatch::Cookies)
  config.middleware.use(config.session_store, config.session_options)

  # Configure middleware for Trestle Admin.
  config.middleware.use(ActionDispatch::Flash)
  config.middleware.use(Rack::MethodOverride)

  # Configure Active Record, Active Job, Active Storage, Action Cable.
  config.active_record.schema_migrations_table_name = "ar_migrations"
  config.active_job.queue_adapter = :good_job
  config.active_support.remove_deprecated_time_with_zone_name = true
  config.active_storage.routes_prefix = "/api/files"
  config.action_cable.mount_path = "/api/cable"

  # Configure logging.
  # config.log_formatter = LogFormatter.new
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger = ActiveSupport::Logger.new($stdout)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end
end
