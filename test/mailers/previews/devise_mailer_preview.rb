# typed: true
# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/devise_mailer
class DeviseMailerPreview < ActionMailer::Preview
  def initialize(*args)
    super
    @record = User.example
  end

  def confirmation_instructions
    token = SecureRandom.hex
    DeviseMailer.confirmation_instructions(record, token)
  end

  def email_changed
    DeviseMailer.email_changed(record)
  end

  def invitation_instructions
    token = SecureRandom.hex
    DeviseMailer.invitation_instructions(record, token)
  end

  def password_change
    DeviseMailer.password_change(record)
  end

  def reset_password_instructions
    token = SecureRandom.hex
    DeviseMailer.reset_password_instructions(record, token)
  end

  def unlock_instructions
    token = SecureRandom.hex
    DeviseMailer.unlock_instructions(record, token)
  end

  private

  attr_reader :record
end
