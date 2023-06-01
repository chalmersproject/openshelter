# typed: true
# frozen_string_literal: true

if Rails.const_defined?(:Server) && Rails.env.production?
  Rails.application.configure do
    config.after_initialize do
      sitemap_path = Rails.public_path.join("sitemap.xml.gz")
      RefreshSitemapJob.perform_later unless File.exist?(sitemap_path)
    end
  end
end
