# typed: true
# frozen_string_literal: true

module Subscriptions
  class TestField < BaseSubscription
    extend T::Sig

    field :value, Int

    def subscribe
      { value: 1 }
    end
  end
end
