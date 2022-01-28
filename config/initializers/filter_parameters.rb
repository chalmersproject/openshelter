# typed: strict
# frozen_string_literal: true

# Configure sensitive parameters which will be filtered from the log file.
#
# Be sure to restart your server when you modify this file.
Rails.application.configure do
  config.filter_parameters +=
    %i[passw secret token _key crypt salt certificate otp ssn]
end
