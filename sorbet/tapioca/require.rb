# typed: strong
# frozen_string_literal: true

require "safe_type"
require "rubocop"

# Patches
require "./sorbet/lib/actionpack.rb"
require "./sorbet/lib/activerecord.rb"
require "./sorbet/lib/activesupport.rb"
require "./sorbet/lib/graphql.rb"
require "./sorbet/lib/graphiql-rails.rb"

# require 'active_support/core_ext/integer/time'
# require 'fileutils'
# require 'json'
# require 'open3'
# require 'rails/all'
# require 'rails/test_help'
# require 'ripper'
# require 'socket'
