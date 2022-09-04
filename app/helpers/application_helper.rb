# typed: strict
# frozen_string_literal: true

module ApplicationHelper
  extend T::Sig
  extend T::Helpers

  abstract!
  requires_ancestor { Kernel }

  # == Prerequisites ==
  sig { abstract.returns(T::Enumerable[T.untyped]) }
  def flash; end

  sig { abstract.returns(ActionController::Parameters) }
  def params; end

  # == Helpers ==
  sig { returns(T.nilable(String)) }
  def debug_targets
    targets = params[:debug]
    targets if targets.is_a?(String) && targets.present?
  end

  sig { returns(T::Boolean) }
  def debug?
    debug_targets.present?
  end

  sig { returns(T::Boolean) }
  def flash?
    flash.any?
  end
end
