# typed: true
class Mutations::CreateShelterMeasurement < Mutations::BaseMutation

  #
  # take in arguments required for making
  # a shelter measurment
  argument :signal_id, ID, required: true
  argument :secret_key, String, required: true
  argument :value, Integer, required: true


  #
  # return the created measurement
  # else return error
  #
  field :shelter_measurement, Types::ShelterMeasurementType
  field :errors, [String]

  def resolve(signal_id:, value:, secret_key:)
    signal = ShelterSignal.find(signal_id)

    if signal.secret_key != secret_key
      raise GraphQL::ExecutionError, "Not authorized; invalid secret key."
    end

    #
    # check if api key exists by searching by submitted token
    #
    shelter_measurement =  signal.measure(value)
    if shelter_measurement.save
      {
        shelter_measurement: shelter_measurement
      }
    else
      {
        errors: shelter_measurement.errors.full_messages
      }
    end
  end
end
