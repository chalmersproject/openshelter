# typed: true
# frozen_string_literal: true

module Tagged
  extend T::Sig
  extend T::Helpers

  abstract!
  requires_ancestor { ApplicationRecord }

  extend ActiveSupport::Concern

  included do
    T.bind(self, T.class_of(ApplicationRecord))

    # == Validations ==
    validates :tags,
              array: {
                length: {
                  maximum: 64,
                },
                format: {
                  with: /\A[\w ]+\z/,
                  message: "only allows letters, numbers, and spaces",
                },
              }
  end
end
