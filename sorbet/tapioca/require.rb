# typed: strong
# frozen_string_literal: true

require "safe_type"
require "rubocop"
require "active_record/connection_adapters/postgresql_adapter"

# Patches
require_relative "./shims/actionpack.rb"
require_relative "./shims/activemodel.rb"
require_relative "./shims/activerecord.rb"
require_relative "./shims/devise.rb"
require_relative "./shims/graphql.rb"
require_relative "./shims/rails_admin.rb"

# require 'active_support/core_ext/integer/time'
# require 'fileutils'
# require 'json'
# require 'open3'
# require 'rails/all'
# require 'rails/test_help'
# require 'ripper'
# require 'socket'
