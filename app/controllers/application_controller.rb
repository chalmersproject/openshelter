# typed: strict
# frozen_string_literal: true

class ApplicationController < ActionController::API
  extend T::Sig

  include ActionController::Cookies
  include ActionController::RequestForgeryProtection
  include AuthlogicHelpers

  # Declare error handlers.
  rescue_from StandardError, with: :show_error
  rescue_from ActionController::ParameterMissing,
              with: :show_parameter_missing_error

  # Enable CSRF protection.
  protect_from_forgery with: :exception, if: :protect_from_forgery?

  private

  sig { returns(Application) }
  def app
    T.cast(Rails.application, Application)
  end

  sig { params(error: StandardError).void }
  def show_error(error)
    status =
      case error
      when ActionController::InvalidAuthenticityToken
        :unprocessable_entity
      else
        :internal_server_error
      end
    render(json: { errors: [{ message: error.message }] }, status: status)
  end

  sig { params(error: ActionController::ParameterMissing).void }
  def show_parameter_missing_error(error)
    render(
      json: {
        errors: [{ message: error.message }],
      },
      status: :unprocessable_entity,
    )
  end

  sig { returns(T::Boolean) }
  def protect_from_forgery?
    true
  end
end
