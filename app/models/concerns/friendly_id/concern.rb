# typed: true
# frozen_string_literal: true

module FriendlyId
  module Concern
    extend T::Sig
    extend T::Helpers

    requires_ancestor { ApplicationRecord }
    mixes_in_class_methods Base

    extend ActiveSupport::Concern

    # prettier-ignore
    included do
      extend(FriendlyId) unless respond_to?(:friendly)
    end
  end
end
