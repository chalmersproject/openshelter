# typed: strict
# frozen_string_literal: true

module Types
  class SubscriptionType < BaseObject
    field :test_field, subscription: Subscriptions::TestField
    # ...
  end
end
