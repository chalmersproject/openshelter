# typed: strict
# frozen_string_literal: true

class SignalTypeType < ActiveRecord::Type::Value
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
