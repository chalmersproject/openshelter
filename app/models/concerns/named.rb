# typed: true
# frozen_string_literal: true

module Named
  extend T::Sig
  extend T::Helpers

  abstract!
  requires_ancestor { ApplicationRecord }

  extend ActiveSupport::Concern

  included do
    T.bind(self, T.class_of(ApplicationRecord))

    # == Dependencies ==
    requires_columns :name

    # == Validations ==
    validates :name, presence: true, length: { maximum: 64 }
  end

  # == Setters ==
  sig { params(value: String).returns(String) }
  def name=(value)
    super(value.strip)
  end
end
