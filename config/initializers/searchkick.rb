# typed: strict
# frozen_string_literal: true

# == Configuration ==
Searchkick.model_options =
  scoped do
    options = {
      merge_mappings: true,
      batch_size: 250,
      settings: {
        analysis: {
          analyzer: {
            searchkick_search: {
              filter: %w[
                lowercase
                asciifolding
                stop
                searchkick_search_shingle
                searchkick_stemmer
              ],
            },
            searchkick_search2: {
              filter: %w[lowercase asciifolding stop searchkick_stemmer],
            },
          },
        },
      },
    }
    options[:callbacks] = :async unless Rails.const_defined?(:Console)
    options
  end

# == AWS OpenSearch Service ==
Searchkick.aws_credentials =
  scoped do
    url = ENV.fetch("ELASTICSEARCH_URL", "http://localhost:9200")
    host = Addressable::URI.parse(url).host
    if host.ends_with?("amazonaws.com")
      _, region = host.split(".")
      {
        region: region,
        access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        secret_access_key: ENV["AWS_ACCESS_KEY_SECRET"],
      }
    end
  end
