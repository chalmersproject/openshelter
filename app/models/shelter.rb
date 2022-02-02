# typed: strict
# frozen_string_literal: true

# == Schema Information
#
# Table name: shelters
#
#  id         :bigint           not null, primary key
#  address    :string
#  email      :string
#  name       :string           not null
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_shelters_on_email  (email)
#  index_shelters_on_phone  (phone)
#

class Shelter < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email,
            email: {
              mode: :strict,
              require_fqdn: true,
            },
            allow_blank: true
  validates :phone, phone: true, allow_blank: true
end
