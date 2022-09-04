# typed: strict
# frozen_string_literal: true

module DeviseHelper
  extend T::Sig
  extend T::Helpers

  abstract!
  requires_ancestor { Kernel }

  # == Prerequisites ==
  sig { abstract.returns(T.nilable(User)) }
  def current_user; end

  # == Helpers ==
  sig { returns(T::Boolean) }
  def admin?
    current_user&.admin? || false
  end
end
