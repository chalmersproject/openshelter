# typed: strict
# frozen_string_literal: true

class UsersController < ApplicationController
  extend T::Sig

  # Set user from params.
  before_action :set_user, only: %i[show update destroy]

  sig { void }
  def initialize
    @user = T.let(nil, T.nilable(User))
    super
  end

  # GET /users/:user_id
  sig { void }
  def show
    payload = { user: @user }
    render(json: payload)
  end

  # PATCH/PUT /users/:user_id
  sig { void }
  def update
    render(json: { error: "That's not cool." })
  end

  # DELETE /users/:user_id
  sig { void }
  def destroy
    # @account.destroy
  end

  # # POST /users/register
  # sig { void }
  # def register
  #   # Create user lmao
  # end

  # # POST /account/login
  # sig { void }
  # def login
  #   # params
  # end

  private

  sig { void }
  def set_user
    user_id = params.require(:id)
    @user = User.find(user_id)
  end

  # Only allow a list of trusted parameters through.
  sig { returns(ActionController::Parameters) }
  def user_params
    raise NotImplementedError
    # params.tap { |params| params.require(:id) }
  end
end
