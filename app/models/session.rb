# typed: strict
# frozen_string_literal: true

require "authlogic_request_adapter"

class Session < Authlogic::Session::Base
  extend T::Sig
  authenticate_with User

  sig { params(request: ActionDispatch::Request).returns(T.nilable(Session)) }
  def self.for(request)
    self.controller = AuthlogicRequestAdapter.new(request) if controller.nil?
    find
  end
end
