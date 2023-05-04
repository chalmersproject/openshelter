module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # Get all Shelters
    field :shelters, [Types::ShelterType], null: false
    def shelters
      Shelter.all
    end

    # Get a specific Shelter
    field :shelter, Types::ShelterType, null: false do
      argument :id, ID, required: true
    end
    def shelter(id:)
      Shelter.find(id)
    end


    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end
