# typed: strict
# frozen_string_literal: true

module Queries
  class BaseQuery < GraphQL::Schema::Resolver
    extend T::Sig

    include ApplicationResolverHelpers

    argument_class Types::BaseArgument
  end
end
