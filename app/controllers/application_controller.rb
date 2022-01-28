# typed: true
# frozen_string_literal: true

class ApplicationController < ActionController::API
  extend T::Sig

  include ActionController::Cookies
  include ActionController::RequestForgeryProtection
  include ActionController::MimeResponds
  include ActionController::Redirecting
  include ActionController::Flash

  # Enable CSRF protection.
  protect_from_forgery with: :exception

  sig { returns(Application) }
  def application
    T.cast(Rails.application, Application)
  end
end
