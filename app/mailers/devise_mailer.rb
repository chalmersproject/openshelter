# typed: strict
# frozen_string_literal: true

class DeviseMailer < Devise::Mailer
  extend T::Sig

  protected

  sig { params(key: Symbol).returns(String) }
  def subject_for(key)
    case key
    when :invitation_instructions
      "You've been invited to the Chalmers Project"
    when :confirmation_instructions
      "Confirm your email for the Chalmers Project"
    else
      super
    end
  end
end
