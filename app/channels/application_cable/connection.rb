# typed: strict
# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    extend T::Sig

    identified_by :current_user

    sig { void }
    def connect
      self.current_user = find_verified_user
    end

    private

    sig { returns(T.nilable(User)) }
    def find_verified_user
      credentials = T.let(cookies.encrypted[:credentials], String)
      token = T.must(credentials.split("::").first)
      User.find_by(persistence_token: token)
    end
  end
end
