# typed: strict
# frozen_string_literal: true

require_relative "../remix"
require "pty"

class Remix::Railtie < Rails::Railtie
  server do
    Thread.new do
      command = Rails.env.production? ? "remix:start" : "remix:dev"
      PTY.spawn("yarn --silent #{command}") do |stdout, _stdin, _pid|
        stdout = T.cast(stdout, IO)
        stdout.each do |line|
          line.chomp!
          next if line.start_with?("(node:", "(Use `node --trace-warnings ...`")
          Remix.logger.info(line)
        end
      end
    end
  end
end
