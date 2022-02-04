# typed: strict
# frozen_string_literal: true

class AuthController < ApplicationController
  extend T::Sig

  sig { void }
  def show
    params = { redirect_url: request.path }
    redirect_to("/account/login?#{params.to_query}")
  end

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
    session = Session.new(email: email, password: password)
    if session.save
      head(:no_content)
    else
      logger.error("Login failed: #{session.errors.to_json}")
      render(
        json: {
          errors: [{ message: "bad credentials" }],
        },
        status: :unauthorized,
      )
    end
  end

  # POST /api/auth/logout
  sig { void }
  def logout
    session = current_session
    session.destroy if session.present?
    head(:no_content)
  end
end
