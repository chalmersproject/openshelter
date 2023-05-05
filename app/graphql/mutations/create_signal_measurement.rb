# typed: true
class Mutations::CreateSignalMeasurement < Mutations::BaseMutation
  argument :signal_id, String, required: true
  argument :shelter_id, String, required: true
  argument :value, String, required: true
  argument :type, String, required
end
