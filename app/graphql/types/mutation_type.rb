# typed: strict
# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    extend T::Sig

    # TODO: remove me
    field :test_field,
          String,
          null: false,
          description: "An example field added by the generator"

    sig { returns(String) }
    def test_field
      "Hello World"
    end
  end
end
