# typed: strict
# frozen_string_literal: true

module Types
  class ValidationErrorType < BaseObject
    extend T::Sig

    field :field, String, method: :attribute
    field :message, String

    sig { override.returns(ActiveModel::Error) }
    def object
      super
    end

    sig { returns(String) }
    def message
      object.full_message + "."
    end
  end
end
