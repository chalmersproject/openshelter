# typed: true

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

  # == Validations ==

  # ensure measurement is not less than or greater than shelter value boundaries
  validates :value, numericality: { greater_than_or_equal_to: 0,
                                    less_than_or_equal_to: :max_value,
                                    only_integer: true}

  #
  # broadcast measurement update to popups on map
  #
  after_create_commit -> {
    shelter_popup_id = "#{["shelter", self.shelter.id, 'popup'].join('_')}"
    broadcast_update_to "shelter_measurements",
    partial: "shelters/popup",
    locals: {
      shelter: self.shelter
    },
    target: shelter_popup_id
  }

  #
  # broadcast measurement update to markers on map
  #
  after_create_commit -> {


    #
    # calculate measurement percentages to be passed to marker
    #

    shelter_marker_id = "#{["shelter", self.shelter.id, 'marker'].join('_')}"
    broadcast_update_to "shelter_measurements",
    partial: "shelters/marker",
    locals: {
      shelter: self.shelter
    },
    target: shelter_marker_id
  }

  def max_value

    case type
    when "bedcount"
      T.must(shelter).max_bedcount
    when "headcount"
      T.must(shelter).max_headcount
    else
      raise "Unknown type"
    end
  end
end
