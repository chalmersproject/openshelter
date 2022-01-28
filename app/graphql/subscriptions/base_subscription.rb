# typed: strict
# frozen_string_literal: true

module Subscriptions
  class BaseSubscription < GraphQL::Schema::Subscription
    extend T::Sig

    include ApplicationResolverHelpers

    object_class Types::BaseObject
    field_class Types::BaseField
    argument_class Types::BaseArgument
  end
end
