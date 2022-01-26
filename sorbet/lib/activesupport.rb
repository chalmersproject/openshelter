# typed: strict
# frozen_string_literal: true

class ActiveSupport::StringInquirer
  extend T::Sig

  sig { returns(T::Boolean) }
  def production?
    false
  end

  sig { returns(T::Boolean) }
  def development?
    false
  end

  sig { returns(T::Boolean) }
  def test?
    false
  end
end
