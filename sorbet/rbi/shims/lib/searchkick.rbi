# typed: strong

module Searchkick
  class << self
    sig do
      params(
          term: T.untyped,
          model: T.untyped,
          options: T.untyped,
          block: T.untyped,
        )
        .returns(Relation)
    end
    def search(
      term = T.unsafe(nil),
      model: T.unsafe(nil),
      **options,
      &block
    ); end
  end

  class Relation
    include Enumerable
  end
end

class ActiveRecord::Base
  extend Searchkick::Model
end
