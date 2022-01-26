# typed: strict
# frozen_string_literal: true

require "pty"

module Remix
  class Proxy < Rack::Proxy
    extend T::Sig

    sig { params(app: T.untyped, opts: T::Hash[Symbol, T.untyped]).void }
    def initialize(app = nil, opts = {})
      super(app, { backend: "http://localhost:3000", **opts })
      spawn_server if Rails.const_defined?("Server")
    end

    sig { void }
    def spawn_server
      Thread.new do
        command = Rails.env.production? ? "remix:start" : "remix:dev"
        PTY.spawn("yarn --silent #{command}") do |stdout, _stdin, _pid|
          stdout = T.cast(stdout, IO)
          stdout.each do |line|
            line.chomp!
            if line.start_with?("(node:", "(Use `node --trace-warnings ...`")
              next
            end
            Remix.logger.info(line)
          end
        end
      end
    end

    sig { params(env: T.untyped).returns(T.untyped) }
    def perform_request(env)
      request = Rack::Request.new(env)
      path = T.cast(request.path, String)

      if path.start_with?("/api", "/admin", "/build/assets")
        @app.call(env)
      else
        super(env)
      end
    end
  end
end
