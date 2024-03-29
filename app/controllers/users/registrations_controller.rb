# rubocop:disable Layout/LineLength
# typed: true
# frozen_string_literal: true

class Users::RegistrationsController < DeviseInvitable::RegistrationsController
  before_action :configure_sign_up_params, only: :create
  before_action :configure_account_update_params, only: :update

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # sig { void }
  # def create
  #   super do |user|
  #     user = T.let(user, User)
  #     InternalMailer.new_user_email(user: user).deliver_later if user.persisted?
  #   end
  # end

  # GET /resource
  sig { void }
  def show
    authenticate_scope!
    @user = T.let(@user, T.nilable(User))
    @user = resource
    render("users/show")
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  sig do
    params(resource: User, params: T::Hash[T.untyped, T.untyped])
      .returns(T::Boolean)
  end
  def update_resource(resource, params)
    if params[:password].present?
      resource.update_with_password(params)
    else
      resource.update_without_password(
        params.excluding("password_confirmation", "current_password"),
      )
    end
  end

  sig { params(resource: User).returns(Symbol) }
  def after_update_path_for(resource)
    :user_registration
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  # == Filters ==
  # If you have extra params to permit, append them to the sanitizer.
  sig { void }
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  # If you have extra params to permit, append them to the sanitizer.
  sig { void }
  def configure_account_update_params
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[first_name last_name display_name avatar bio],
    )
  end
end
