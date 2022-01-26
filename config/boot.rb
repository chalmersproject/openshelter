# typed: strong
# frozen_string_literal: true

ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

# Configure env
ENV["RAILS_ENV"] = ENV["ENV"]
ENV["NODE_ENV"] = ENV["ENV"]

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.
