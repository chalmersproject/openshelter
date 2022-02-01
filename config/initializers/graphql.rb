# typed: strict
# frozen_string_literal: true

GraphQL::RailsLogger.configure do |config|
  config.skip_introspection_query = true
  config.white_list = { "GraphQLController" => %w[execute] }
end
