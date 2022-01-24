# typed: strict
# frozen_string_literal: true

require "./app/logger/log_formatter.rb"

formatter = LogFormatter.new
SemanticLogger.add_appender(io: $stdout, formatter: formatter)
SemanticLogger.backtrace_level = :warn
