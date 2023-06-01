# typed: true
# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[edit update destroy]

  # # GET /users or /users.json
  # def index
  #   @users = User.all
  # end

  # GET /users/1
  sig { void }
  def show
    @user = T.must(@user)
    redirect_to(%i[user registration]) if @user == current_user
  end

  # GET /users/new
  sig { void }
  def new
    @user = User.new
  end

  # GET /users/1/edit
  sig { void }
  def edit; end

  # POST /users or /users.json
  # def create
  #   @user = User.new(user_params)

  #   respond_to do |format|
  #     if @user.save
  #       format.html do
  #         redirect_to(
  #           user_url(@user),
  #           notice: "User was successfully created."
  #         )
  #       end
  #       format.json { render(:show, status: :created, location: @user) }
  #     else
  #       format.html { render(:new, status: :unprocessable_entity) }
  #       format.json do
  #         render(json: @user.errors, status: :unprocessable_entity)
  #       end
  #     end
  #   end
  # end

  # PATCH/PUT /users/1 or /users/1.json
  # def update
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html do
  #         redirect_to(
  #           user_url(@user),
  #           notice: "User was successfully updated.",
  #         )
  #       end
  #       format.json { render(:show, status: :ok, location: @user) }
  #     else
  #       format.html { render(:edit, status: :unprocessable_entity) }
  #       format.json do
  #         render(json: @user.errors, status: :unprocessable_entity)
  #       end
  #     end
  #   end
  # end

  # DELETE /users/1
  sig { void }
  def destroy
    @user = T.must(@user)
    @user.destroy!
    respond_with(@user)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  sig { void }
  def set_user
    @user = T.let(@user, T.nilable(User))
    @user = User.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  sig { returns(ActionController::Parameters) }
  def user_params
    params.fetch(:user, {})
  end
end
