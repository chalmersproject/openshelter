# typed: strict
# frozen_string_literal: true

class AccountsController < ApplicationController
  extend T::Sig

  sig { void }
  def initialize
    super
    @user = T.let(nil, T.nilable(User))
  end

  before_action :set_user, only: %i[show edit update destroy]

  sig { returns(ActionController::Parameters) }
  def login_params
    params.permit(:email, :password, :redirect_url) do |params|
      params.require(%i[email password])
    end
  end

  # POST /account/login
  sig { void }
  def login
    # params = login_params
    email, password = params.require(%i[email password])
    session = UserSession.new(email: email, password: password)
    unless session.save
      render(
        partial: "errors/validation",
        message: "Bad credentials",
        params: params,
        errors: session.errors,
        status: :unauthorized,
      ) and return
    end

    # Redirect to root.
    redirect_url = params.fetch(:redirect_url, "/")
    redirect_to(redirect_url)
  end

  # POST /account/logout
  sig { void }
  def logout
    # Destroy session.
    session = current_user_session
    session.destroy if session.present?

    # Redirect to root.
    redirect_url = params.fetch(:redirect_url, "/")
    redirect_to(redirect_url)
  end

  private

  sig { void }
  def set_user
    @user = current_user
  end
end
