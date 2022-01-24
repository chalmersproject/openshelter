# typed: strict
# frozen_string_literal: true

require "zeitwerk"

module Remix
  extend T::Sig

  sig { returns(SemanticLogger::Logger) }
  def self.logger
    SemanticLogger[self]
  end
end

loader = Zeitwerk::Loader.for_gem
loader.setup
