# typed: true
# frozen_string_literal: true

# Add time helpers.
require "active_support/core_ext/integer/time"

# Automatically reload view components.
require "view_component/engine"

Rails.application.configure do
  # == URLs ==
  config.before_configuration do
    routes.default_url_options = {
      protocol: "http",
      host: "localhost",
      port: 3000,
    }
  end

  # == Bullet ==
  config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.add_footer = true
  end

  # == Code Loading ==
  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # == Security ==
  # Show full error reports.
  config.consider_all_requests_local = true

  # == Development Hosts ==
  config.hosts << /[a-z0-9-]+\.ngrok\.io/

  # == Metrics ==
  # Respond with server timing metrics.
  config.server_timing = true

  # == Caching ==
  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      "Cache-Control" => "public, max-age=#{2.days.to_i}",
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # == Active Storage ==
  # Store uploaded files on the local file system (see config/storage.yml for
  # options).
  config.active_storage.service = ENV.fetch("RAILS_STORAGE_SERVICE", :local)

  # == Action Mailer ==
  config.action_mailer.delivery_method =
    ENV.fetch("RAILS_MAILER", "smtp").to_sym
  config.action_mailer.smtp_settings = { address: "127.0.0.1", port: 1025 }
  config.action_mailer.perform_caching = false

  # Don't care if the mailer can't send.
  # config.action_mailer.raise_delivery_errors = false

  # == Active Support ==
  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # == Assets ==
  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # == i18n ==
  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # == Action View ==
  # Annotate rendered view with file names.
  config.action_view.annotate_rendered_view_with_filenames = true

  # == Action Cable ==
  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true

  # == Hotwire Livereload ==
  config.hotwire_livereload.reload_method = :turbo_stream
end
