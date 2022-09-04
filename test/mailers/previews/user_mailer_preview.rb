# typed: true
# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def initialize(*args)
    super
    @user = User.example
  end

  # def registration_email
  #   UserMailer.registration_email(user: user)
  # end

  private

  attr_reader :user
end
