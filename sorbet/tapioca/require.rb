# typed: strong
# frozen_string_literal: true

require "safe_type"
require "rubocop"
require "active_record/connection_adapters/postgresql_adapter"

# Patches
require_relative "./shims/graphql"
require_relative "./shims/graphiql-rails"
require_relative "./shims/actionpack"
require_relative "./shims/activemodel"
require_relative "./shims/activerecord"
require_relative "./shims/rails_admin"
