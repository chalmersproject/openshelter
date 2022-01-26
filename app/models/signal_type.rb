# typed: strict
# frozen_string_literal: true

class SignalType < T::Enum
  extend T::Sig

  enums do
    Spot = new("spot")
    Bed = new("bed")
  end

  sig { returns(Symbol) }
  def to_sym
    case self
    when Spot
      :spot
    when Bed
      :bed
    end
  end
end
