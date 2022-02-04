# typed: strict
# frozen_string_literal: true

module Types
  class SubscriptionType < Types::BaseObject
    field :test_field, subscription: Subscriptions::TestField
    # ...
  end
end
