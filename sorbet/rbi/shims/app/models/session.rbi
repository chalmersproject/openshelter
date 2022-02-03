# typed: strict

class Session
  sig { returns(User) }
  def user; end

  sig { params(id: T.untyped, priority_record: T.untyped).returns(T.self_type) }
  def find(id = T.unsafe(nil), priority_record = T.unsafe(nil)); end
end
