# typed: ignore
# frozen_string_literal: true

class ApplicationAPI < Grape::API
  extend T::Sig

  module Helpers
    extend T::Sig
    extend T::Helpers

    extend Grape::API::Helpers

    include ActionController::Cookies
    include ActionController::RequestForgeryProtection

    sig { returns(Application) }
    def app
      T.cast(Rails.application, Application)
    end

    # sig { returns(Rack::Session) }
    # def session
    #   env["rack.session"]
    # end

    # sig { void }
    # def protect_against_forgery
    #   error!("Unauthorized", 401) unless verified_request?
    # end

    # sig { returns(T::Boolean) }
    # def verified_request?
    #   !protect_against_forgery? || request.get? || request.head? ||
    #     form_authenticity_token == request.headers["X-CSRF-Token"] ||
    #     form_authenticity_token == request.headers["X-Csrf-Token"]
    # end

    # # sig {}
    # def form_authenticity_token
    #   session[:csrf_token] ||= SecureRandom.base64(32)
    # end

    # sig { returns(T::Boolean) }
    # def protect_against_forgery?
    #   allow_forgery_protection =
    #     Rails.configuration.action_controller.allow_forgery_protection
    #   allow_forgery_protection.nil? || allow_forgery_protection
    # end

    sig { returns(T.nilable(UserSession)) }
    def current_user_session
      unless defined?(@current_users_session)
        @current_user_session = T.let(UserSession.find, T.nilable(UserSession))
      end
      @current_user_session
    end

    sig { returns(T.nilable(User)) }
    def current_user
      unless defined?(@current_user)
        session = current_user_session
        @current_user = T.let(nil, T.nilable(User))
        @current_user = session.user if session.present?
      end
      @current_user
    end
  end

  T::Sig::WithoutRuntime.sig { returns(Application) }
  def self.app
    T.cast(Rails.application, Application)
  end

  T::Sig::WithoutRuntime.sig do
    params(
      description: String,
      summary: T.nilable(String),
      tag: T.nilable(String),
      options: T.untyped,
    ).void
  end
  def self.docs(description, summary: description, tag: nil, **options)
    options.with_defaults!({ summary: summary })
    options[:tags] = [tag] if tag.present?
    desc(description, options)
  end

  T::Sig::WithoutRuntime.sig { params(base_instance_parent: T.untyped).void }
  def self.initial_setup(base_instance_parent)
    super
    base_instance_parent.helpers(Helpers)
  end
end

Grape::API::Instance
