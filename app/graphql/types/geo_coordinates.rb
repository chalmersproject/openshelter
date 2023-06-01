
# module Types
#   class LocationType = GraphQL::ObjectType.define do

#     description 'A geo location.'

#     field :longitude, !types.Float, 'Longitude', property: :x
#     field :latitude, !types.Float, 'Latitude', property: :y
#   end
# end
module Types
  class GeoCoordinates < GraphQL::Types::JSON
    description 'Geo coordinate, latitude followed by longitude.'
    # Geo::Coord.parse(value)

    # TODO: breakout latitude and longitude from POINT data response
    # Latitude

    # Longitude


  end
end
