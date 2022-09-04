# typed: strict
# frozen_string_literal: true

class PaginationComponent < ApplicationComponent
  Paginatable =
    T.type_alias do
      T.any(
        ActiveRecord::Relation,
        Searchkick::Relation,
        Kaminari::PaginatableArray,
      )
    end

  sig do
    params(
      paginatable: Paginatable,
      window: Integer,
      outer_window: Integer,
      kwargs: T.untyped,
    ).void
  end
  def initialize(paginatable:, window: 3, outer_window: 1, **kwargs)
    super(**kwargs)
    @paginatable = paginatable
    @window = window
    @outer_window = outer_window
  end

  sig { override.returns(T::Boolean) }
  def render?
    !@paginatable.nil?
  end

  private

  sig { returns(Paginatable) }
  attr_reader :paginatable

  sig { returns(Integer) }
  attr_reader :window

  sig { returns(Integer) }
  attr_reader :outer_window
end
