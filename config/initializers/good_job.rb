# typed: strict
# frozen_string_literal: true

Rails.application.configure do
  config.good_job.tap do |config|
    # == Cron ==
    config.enable_cron = true
    config.cron = {
      cleanup_storage: {
        cron: "0 0-23/6 * * *",
        class: "CleanupStorageJob",
        description: "Schedule purging of unattached ActiveStorage blobs.",
      },
    }
    if Rails.env.production?
      # rubocop:disable Performance/RedundantMerge
      config.cron.merge!(
        refresh_sitemap: {
          cron: "0 0-23/6 * * *",
          class: "RefreshSitemapJob",
          description: "Update static sitemaps for search engines to index.",
        },
      )
      # rubocop:enable Performance/RedundantMerge
    end

    # == Retry ==
    config.retry_on_unhandled_error = false

    # == Logging ==
    #   scoped do
    #     logger = ActiveSupport::Logger.new($stdout)
    #     logger.level = config.log_level if config.log_level.present?
    #     logger.formatter = config.log_formatter
    #     ActiveSupport::TaggedLogging.new(logger)
    #   end
  end
end
