# typed: strict
# frozen_string_literal: true

module Slugged
  extend T::Sig
  extend T::Helpers

  abstract!
  requires_ancestor { ApplicationRecord }

  extend ActiveSupport::Concern

  included do
    T.bind(self, T.class_of(ApplicationRecord))

    # == Validations ==
    validates :slug,
              presence: true,
              length: {
                in: 2..64,
              },
              format: {
                with: /\A([a-z0-9]+-)*[a-z0-9]+(--[A-Za-z0-9]+)?\z/,
              },
              allow_nil: true

    # == Callbacks ==
    before_validation :regenerate_slug_if_necessary, on: :update

    private

    # == Callbacks ==
    # TODO: Remove when all UUID slug tails are gone. How to check?
    sig { void }
    def regenerate_slug_if_necessary
      head, tail = slug.split("--")
      if tail.present? && "-".in?(tail)
        tail =
          Nanoid.generate(
            size: 10,
            alphabet:
              "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
          )
        self.slug = [head, tail].join("--")
      end
    end
  end
end
