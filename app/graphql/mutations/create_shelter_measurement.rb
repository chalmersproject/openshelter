# typed: true
class Mutations::CreateShelterMeasurement < Mutations::BaseMutation

  #
  # take in arguments required for making
  # a shelter measurment
  argument :signal_id, ID, required: true
  argument :signal_api_key, String, required: true
  argument :value, Integer, required: true


  #
  # return the created measurement
  # else return error
  #
  field :shelter_measurement, Types::ShelterMeasurementType, null: false
  field :errors, [String], null: false

  def resolve(signal_id:, value:, signal_api_key:)
    signal = ShelterSignal.find(id: signal_id)

    shelter_measurement = signal.measure(value)
    )

    if shelter_measurement.save
      {
        shelter_measurement: shelter_measurement,
        errors: []
      }
    else
      {
        shelter_measurement: null,
        errors: shelter_measurement.errors.full_messages
      }
    end
  end
end
