# typed: strict

# Default non-colored text log output
class SemanticLogger::Formatters::Default < ::SemanticLogger::Formatters::Base
  # Default text log format
  # Generates logs of the form:
  # 2011-07-19 14:36:15.660235 D [1149:ScriptThreadProcess] Rails -- Hello World
  sig do
    params(log: SemanticLogger::Log, logger: SemanticLogger::Logger)
      .returns(String)
  end
  def call(log, logger); end

  # Duration
  sig { returns(T.nilable(String)) }
  def duration; end

  # Ruby file name and line number that logged the message.
  sig { returns(T.nilable(String)) }
  def file_name_and_line; end

  # Log level
  sig { returns(String) }
  def level; end

  # Log message
  sig { returns(T.nilable(String)) }
  def message; end

  # Class / app name
  sig { returns(T.nilable(String)) }
  def name; end

  # Returns [String] the available process info
  # Example:
  # [18934:thread_name test_logging.rb:51]
  sig { returns(T.nilable(String)) }
  def process_info; end

  # Name of the thread that logged the message.
  sig { returns(T.nilable(String)) }
  def thread_name; end
end
