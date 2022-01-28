# typed: strict
# frozen_string_literal: true

# Register custom attribute types.
Rails.application.configure do
  config.after_initialize do
    ActiveRecord::Type.register(:signal_type, SignalType::Type)
    ActiveModel::Type.register(:signal_type, SignalType::Type)
  end
end
