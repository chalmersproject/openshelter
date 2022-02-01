# typed: strict
# frozen_string_literal: true

class AuthController < ApplicationController
  extend T::Sig

  # sig { void }
  # def csrf
  #   csrf = { request_forgery_protection_token => form_authenticity_token }
  #   render(json: csrf)
  # end

  sig { returns(ActionController::Parameters) }
  def login_params
    params.permit(:email, :password, :redirect_url) do |params|
      params.require(%i[email password])
    end
  end

  # POST /api/auth/login
  sig { void }
  def login
    params = login_params
    email, password = params.require(%i[email password])
    session = UserSession.new(email: email, password: password)
    unless session.save
      logger.error("Login failed: #{session.errors.to_json}")
      render(
        json: {
          errors: [{ message: "Bad credentials" }],
        },
        status: :unauthorized,
      ) and return
    end
    head(:no_content) # 204
  end

  # POST /api/auth/logout
  sig { void }
  def logout
    session = current_user_session
    session.destroy if session.present?
    head(:no_content)
  end
end
