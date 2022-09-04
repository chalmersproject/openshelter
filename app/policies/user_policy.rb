# typed: strict
# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  extend T::Sig

  # == Rules ==
  sig { returns(T::Boolean) }
  def show?
    true
  end

  sig { returns(T::Boolean) }
  def manage?
    authenticate! == record
  end

  alias_rule :operate?, to: :manage?
end
