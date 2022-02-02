# typed: strict
# frozen_string_literal: true

module Mutations
  class CreateShelter < BaseMutation
    class Payload < T::Struct
      const :errors, T.nilable(ActiveModel::Errors)
      const :shelter, T.nilable(Shelter)
    end

    field :errors, [Types::ValidationErrorType]
    field :shelter, Types::ShelterType

    argument :address, String, required: false
    argument :email, String, required: false
    argument :name, String
    argument :phone, String, required: false

    sig { params(attributes: T.untyped).returns(Payload) }
    def resolve(**attributes)
      shelter = Shelter.new(**attributes)
      if shelter.save
        Payload.new(shelter: shelter)
      else
        Payload.new(errors: shelter.errors)
      end
    end
  end
end
