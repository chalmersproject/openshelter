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

  class Type < ActiveRecord::Type::Value
    extend T::Sig

    sig { override.params(value: SignalType).returns(String) }
    def serialize(value)
      value.serialize
    end

    sig { params(value: String).returns(SignalType) }
    def deserialize(value)
      SignalType.deserialize(value)
    end
  end
end
