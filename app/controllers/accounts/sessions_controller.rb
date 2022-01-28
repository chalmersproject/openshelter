# typed: true
# frozen_string_literal: true

module Accounts
  class SessionsController < Devise::SessionsController
    extend T::Sig

    include ApplicationController::Remix

    # Get /account/login
    def new
      respond_to do |format|
        format.json do
          payload = { user: current_user }
          render(json: payload)
        end
        format.html { proxy }
      end
    end

    def create
      session[:user_return_to] = "/"
      super
    end
  end
end
