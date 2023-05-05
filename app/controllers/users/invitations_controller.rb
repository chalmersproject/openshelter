# typed: true
# frozen_string_literal: true

class Users::InvitationsController < Devise::InvitationsController
  extend T::Sig

  # == Filters ==
  before_action :configure_accept_invitation_params, only: :update

  private

  # == Filters ==
  sig { void }
  def configure_accept_invitation_params
    devise_parameter_sanitizer.permit(
      :accept_invitation,
      keys: %i[first_name last_name],
    )
  end
end
