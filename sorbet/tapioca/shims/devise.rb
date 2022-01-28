# typed: strict
# frozen_string_literal: true

module Devise::Controllers::Helpers
  extend T::Sig

  define_helpers :user

  sig { returns(T.nilable(User)) }
  def current_user; end

  sig { returns(T::Boolean) }
  def user_signed_in?
    false
  end

  # def user_session
  # end
end

module Devise::Models::Confirmable
  extend T::Sig

  sig { returns(T::Boolean) }
  def confirm
    false
  end

  sig { void }
  def ass; end
end
