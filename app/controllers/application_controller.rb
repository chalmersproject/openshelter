# typed: strong
# frozen_string_literal: true

class ApplicationController < ActionController::API
  extend T::Sig

  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :exception
end
