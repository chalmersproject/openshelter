# == Schema Information
#
# Table name: shelter_measurements
#
#  id         :uuid             not null, primary key
#  type       :string           not null
#  value      :integer          not null
#  created_at :timestamptz      not null
#  shelter_id :uuid             not null
#  signal_id  :uuid             not null
#
# Indexes
#
#  index_shelter_measurements_on_created_at  (created_at)
#  index_shelter_measurements_on_shelter_id  (shelter_id)
#  index_shelter_measurements_on_signal_id   (signal_id)
#  index_shelter_measurements_on_type        (type)
#  index_shelter_measurements_on_value       (value)
#
# Foreign Keys
#
#  fk_rails_...  (shelter_id => shelters.id)
#  fk_rails_...  (signal_id => shelter_signals.id)
#
class ShelterMeasurement < ApplicationRecord
  self.inheritance_column = nil

  # == Attributes ==
  enumerize :type, in: %w[bedcount headcount]

  # == Associations ==
  belongs_to :shelter, inverse_of: :measurements
  belongs_to :signal, class_name: "ShelterSignal", inverse_of: :measurements
end
