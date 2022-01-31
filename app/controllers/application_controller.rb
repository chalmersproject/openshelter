# typed: strict
# frozen_string_literal: true

class ApplicationController < ActionController::API
  extend T::Sig

  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  # Declare helper methods.
  helper_method :current_user_session, :current_user

  # Define error handlers.
  rescue_from StandardError, with: :show_error
  rescue_from ActionController::ParameterMissing,
              with: :show_parameter_missing_error

  # Enable CSRF protection.
  protect_from_forgery with: :exception

  protected

  sig { returns(Application) }
  def app
    T.cast(Rails.application, Application)
  end

  sig { returns(T.nilable(UserSession)) }
  def current_user_session
    unless defined?(@current_users_session)
      @current_user_session = T.let(UserSession.find, T.nilable(UserSession))
    end
    @current_user_session
  end

  sig { returns(T.nilable(User)) }
  def current_user
    unless defined?(@current_user)
      session = current_user_session
      @current_user = T.let(nil, T.nilable(User))
      @current_user = session.user if session.present?
    end
    @current_user
  end

  sig { params(exception: Exception).void }
  def show_error(exception)
    detail = T.let(exception.message.humanize, String)
    render(
      json: {
        errors: [{ detail: detail.end_with?(".") ? detail : detail + "." }],
      },
    )
  end

  sig { params(error: ActionController::ParameterMissing).void }
  def show_parameter_missing_error(error)
    render(
      json: {
        errors: [
          { title: "Missing Parameters", detail: "#{error.message.humanize}." },
        ],
      },
    )
  end
end
