# typed: strict

class ActiveSupport::StringInquirer
  sig { returns(T::Boolean) }
  def production?; end

  sig { returns(T::Boolean) }
  def development?; end

  sig { returns(T::Boolean) }
  def test?; end
end
