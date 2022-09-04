# rubocop:disable Lint/AmbiguousRegexpLiteral
# typed: strict
# frozen_string_literal: true

class ApplicationMailbox < ActionMailbox::Base
  routing /@messages\./i => :messages
end
