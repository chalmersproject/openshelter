# typed: strict
# frozen_string_literal: true

require "active_record/connection_adapters/postgresql_adapter"
require "active_record/connection_adapters/postgis_adapter"
require "sprockets/rails/task"

require "geocoder/lookups/google"
require "geocoder/lookups/nominatim"
require "geocoder/results/google"
require "geocoder/results/nominatim"

# Eager-load and initialize application.
Rails.application.eager_load!
Rails.application.initialize!
