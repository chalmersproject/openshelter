# typed: strict
# frozen_string_literal: true

module Subscriptions
  class BaseSubscription < GraphQL::Schema::Subscription
    extend T::Sig

    include ResolverHelpers

    argument_class Types::BaseArgument
    object_class Types::BaseObject
    field_class Types::BaseField

    sig do
      params(
          args: T.untyped,
          kwargs: T.untyped,
          block: T.nilable(T.proc.bind(Types::BaseField).void),
        )
        .returns(T.untyped)
    end
    def self.field(*args, **kwargs, &block)
      super
    end
  end
end
