# typed: true
# frozen_string_literal: true

class LogFormatter < ::SemanticLogger::Formatters::Color
  def time
    Time.current.strftime("%Y-%m-%d %H:%M:%S")
  end

  def process_info
    file_name_and_line
  end
end
