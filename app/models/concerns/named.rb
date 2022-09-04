# typed: strict
# frozen_string_literal: true

module Named
  extend T::Sig
  extend T::Helpers

  abstract!
  requires_ancestor { ApplicationRecord }

  extend ActiveSupport::Concern

  included do
    T.bind(self, T.class_of(ApplicationRecord))

    # == Validations ==
    validates :name, presence: true, length: { maximum: 64 }
  end

  private

  # == Setters ==
  sig { params(value: String).returns(String) }
  def name=(value)
    super(name.strip)
  end
end
