# typed: true
# frozen_string_literal: true

module MetaTagsHelper
  extend T::Sig
  extend T::Helpers

  abstract!
  requires_ancestor { Kernel }

  # == Prerequisites ==
  sig { abstract.returns(MetaTags::MetaTagsCollection) }
  def meta_tags; end

  # == Helpers ==
  def meta_tags?
    meta_tags.present?
  end
end
