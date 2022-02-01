# typed: strict
# frozen_string_literal: true

module Queries
  class BaseQuery < GraphQL::Schema::Resolver
    extend T::Sig

    include ResolverHelpers

    argument_class Types::BaseArgument
  end
end
