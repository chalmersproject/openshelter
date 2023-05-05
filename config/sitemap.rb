# typed: true
# frozen_string_literal: true

Sitemap = SitemapGenerator::Sitemap

# Set the host name for URL creation.
Sitemap.default_host = Rails.application.routes.url_helpers.root_url

# Set search engines.
Sitemap.search_engines = {
  google: "http://www.google.com/webmasters/tools/ping?sitemap=%s",
}

# Create links.
Sitemap.create do
  T.bind(self, SitemapGenerator::Interpreter)

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host

  # == Static Pages ==
  HighVoltage
    .page_ids
    .reject { |id| /[45][0-9]{2}/.match?(id) }
    .each { |page| add(page) }
end
