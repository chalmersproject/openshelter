# typed: strict
# frozen_string_literal: true

module Types
  class MutationType < BaseObject
    extend T::Sig

    field :create_shelter, mutation: Mutations::CreateShelter

    field :greet,
          String,
          null: false,
          description: "An example field added by the generator" do
      argument :value, String
    end

    sig { params(value: String).returns(String) }
    def greet(value:)
      "Hello #{value}"
    end
  end
end
