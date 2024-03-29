# typed: true
# frozen_string_literal: true

# == Schema Information
#
# Table name: shelter_signals
#
#  id         :uuid             not null, primary key
#  secret_key :string           not null
#  type       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shelter_id :uuid             not null
#
# Indexes
#
#  index_shelter_signals_on_secret_key  (secret_key) UNIQUE
#  index_shelter_signals_on_shelter_id  (shelter_id)
#  index_shelter_signals_on_type        (type)
#
# Foreign Keys
#
#  fk_rails_...  (shelter_id => shelters.id)
#
class ShelterSignal < ApplicationRecord
  self.inheritance_column = nil

  # == Attributes ==
  enumerize :type, in: %w[bedcount headcount]
  attribute :secret_key, :string, default: -> { SecureRandom.hex(12) }
  attribute :id, type: :uuid
  attribute :shelter_id, type: :uuid
  attribute :type, type: :string

  # == Associations ==
  belongs_to :shelter
  has_many :measurements,
           class_name: "ShelterMeasurement",
           foreign_key: :signal_id,
           inverse_of: :signal,
           dependent: :destroy

  # == Method
  sig { returns(String )}
  def name
    "#{type.humanize} Signal at #{T.must(shelter).name}"
  end

  sig {params(value: Integer).returns(ShelterMeasurement)}
  def measure(value)
    measurements.create(type: type, shelter: shelter, value: value)
  end
end
