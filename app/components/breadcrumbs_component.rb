# typed: strict
# frozen_string_literal: true

class BreadcrumbsComponent < ApplicationComponent
  extend T::Sig

  sig { override.returns(T::Boolean) }
  def render?
    breadcrumbs?
  end
end
