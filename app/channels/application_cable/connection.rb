# typed: strict
# frozen_string_literal: true

require "authlogic_finder"

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    extend T::Sig

    identified_by :current_user

    sig { void }
    def connect
      finder = AuthlogicFinder.new(request)
      self.current_user = finder.find_authenticated_user
    end
  end
end
