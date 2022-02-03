# typed: strict
# frozen_string_literal: true

require "authlogic_request_adapter"

class Session < Authlogic::Session::Base
  extend T::Sig
  authenticate_with User

  sig do
    params(request: ActionDispatch::Request, id: T.untyped)
      .returns(T.nilable(Session))
  end
  def self.for(request, id = nil)
    self.controller = AuthlogicRequestAdapter.new(request) if controller.nil?
    find(id)
  end
end
