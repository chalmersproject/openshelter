# typed: true
# frozen_string_literal: true

require "active_support/dependencies/autoload"

module ActiveForm
  extend ActiveSupport::Autoload

  autoload :Base
  autoload :SimpleFormHelpers
end
