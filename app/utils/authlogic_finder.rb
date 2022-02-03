# typed: strict
# frozen_string_literal: true

class AuthlogicFinder
  extend T::Sig

  sig { params(request: ActionDispatch::Request).void }
  def initialize(request)
    @request = T.let(request, ActionDispatch::Request)
  end

  sig { returns(T.nilable(User)) }
  def find_authenticated_user
    credentials = find_credentials
    return nil if credentials.blank?

    token = T.must(credentials.split("::").first)
    User.find_by(persistence_token: token)
  end

  private

  sig { returns(T.nilable(String)) }
  def find_credentials
    @request.cookie_jar.encrypted[:credentials]
  end
end
