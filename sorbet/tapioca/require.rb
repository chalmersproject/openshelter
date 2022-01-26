# typed: strong
# frozen_string_literal: true

require "safe_type"
require "rubocop"

# Patches
require_relative "./lib/actionpack.rb"
require_relative "./lib/activemodel.rb"
require_relative "./lib/activerecord.rb"
require_relative "./lib/activesupport.rb"
require_relative "./lib/graphql.rb"
require_relative "./lib/graphiql-rails.rb"

# require 'active_support/core_ext/integer/time'
# require 'fileutils'
# require 'json'
# require 'open3'
# require 'rails/all'
# require 'rails/test_help'
# require 'ripper'
# require 'socket'
