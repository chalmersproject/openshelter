# typed: strict
# frozen_string_literal: true

class ApplicationController < ActionController::API
  extend T::Sig

  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  # Declare helper methods.
  helper_method :current_user_session, :current_user

  # Declare error handlers.
  rescue_from StandardError, with: :show_error
  rescue_from ActionController::ParameterMissing,
              with: :show_parameter_missing_error

  # Enable CSRF protection.
  protect_from_forgery with: :exception, if: :protect_from_forgery?

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

  private

  sig { params(error: StandardError).void }
  def show_error(error)
    message = T.let(error.message, String)
    message += "." unless message.end_with?(".")
    status =
      case error
      when ActionController::InvalidAuthenticityToken
        :unprocessable_entity
      else
        :internal_server_error
      end
    render(json: { errors: [{ message: message }] }, status: status)
    raise(error)
  end

  sig { params(error: ActionController::ParameterMissing).void }
  def show_parameter_missing_error(error)
    logger.error(error)
    message = T.let(error.message, String)
    message += "." unless message.end_with?(".")
    render(
      json: {
        errors: [{ message: message }],
      },
      status: :unprocessable_entity,
    )
    raise(error)
  end

  sig { returns(T::Boolean) }
  def protect_from_forgery?
    true
  end
end
