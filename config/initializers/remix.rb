# typed: strict
# frozen_string_literal: true

require "./lib/remix.rb"

Rails.application.config.middleware.use(Remix::Proxy)
