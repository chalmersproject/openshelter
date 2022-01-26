# typed: strict
# frozen_string_literal: true

Rails.application.config do
  # Register SignalType
  ActiveRecord::Type.register(:signal_type, SignalType::Type)
  ActiveModel::Type.register(:signal_type, SignalType::Type)
end
