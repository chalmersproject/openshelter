# typed: strict
# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

Rails.application.configure do
  # Configure sensitive parameters which will be filtered from the log file.
  config.filter_parameters +=
    %i[pass passw password secret token _key crypt salt certificate otp ssn]

  config.action_controller.always_permitted_parameters = %w[
    controller
    action
    format
    authenticity_token
  ]
end
