# typed: true
# frozen_string_literal: true

class AccountsController < Devise::SessionsController
  extend T::Sig

  include ApplicationController::Remix

  # before_action :set_account, only: %i[show update destroy]

  # GET /account
  def show
    respond_to do |format|
      format.json do
        payload = { user: current_user }
        render(json: payload)
      end
      format.html { proxy }
    end
  end

  # # PATCH/PUT /account
  # def update
  #   if @account.update(account_params)
  #     render json: @account
  #   else
  #     render json: @account.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /account
  # def destroy
  #   @account.destroy
  # end

  # GET /account/register
  def register
    proxy
  end

  # Get /account/login
  def login
    respond_to do |format|
      format.json do
        payload = { user: current_user }
        render(json: payload)
      end
      format.html { proxy }
    end
  end

  # private

  # # Use callbacks to share common setup or constraints between actions.
  # def set_account
  #   @account = Account.find(params[:id])
  # end

  # # Only allow a list of trusted parameters through.
  # def account_params
  #   params.fetch(:account, {})
  # end
end
