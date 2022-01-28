# typed: strict
# frozen_string_literal: true

require "active_record/connection_adapters/postgresql_adapter"

# Use TIMESTAMPTZ as native type for :datetime columns.
ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.datetime_type = :timestamptz
