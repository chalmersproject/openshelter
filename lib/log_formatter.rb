# typed: true
# frozen_string_literal: true

class LogFormatter < ActiveSupport::Logger::SimpleFormatter
  def call(severity, time, progname, msg)
    severity = format("%-5s", severity.to_s)
    time = time.strftime("%Y-%m-%d %H:%M:%S")
    if progname.present?
      "[#{severity} #{time}] #{msg}\n"
    else
      "[#{severity} #{time}] (#{progname}) #{msg}\n"
    end
  end
end
