# typed: strict
# frozen_string_literal: true

module Types
  class SignalTypeType < BaseEnum
    value "BED", value: SignalType::Bed
    value "SPOT", value: SignalType::Spot
  end
end
