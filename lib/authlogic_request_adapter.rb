# typed: true
# frozen_string_literal: true

class AuthlogicRequestAdapter < Authlogic::ControllerAdapters::AbstractAdapter
  extend T::Sig

  sig { params(request: ActionDispatch::Request).void }
  def initialize(request)
    @request = T.let(request, ActionDispatch::Request)
    super
  end

  def cookies
    @request.cookie_jar
  end

  def authenticate_with_http_basic
    raise "not implemented"
  end
end
