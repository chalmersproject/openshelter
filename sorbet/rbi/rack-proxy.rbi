# typed: strict

class Rack::Proxy
  sig do
    params(app: T.untyped, opts: T.nilable(T::Hash[Symbol, T.untyped])).void
  end
  def initialize(app = nil, opts = nil)
    @app = app
  end

  sig { params(env: T.untyped).returns(T.untyped) }
  def perform_request(env); end
end
