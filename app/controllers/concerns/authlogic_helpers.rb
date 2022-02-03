# typed: strict
# frozen_string_literal: true

module AuthlogicHelpers
  extend T::Sig
  extend ActiveSupport::Concern

  include AbstractController::Helpers

  included { helper_method :current_user_session, :current_user }

  private

  sig { returns(T.nilable(Session)) }
  def current_session
    unless defined?(@current_session)
      @current_session = T.let(Session.find, T.nilable(Session))
    end
    @current_session
  end

  sig { returns(T.nilable(User)) }
  def current_user
    unless defined?(@current_user)
      session = current_session
      @current_user = T.let(nil, T.nilable(User))
      @current_user = session.user if session.present?
    end
    @current_user
  end
end
