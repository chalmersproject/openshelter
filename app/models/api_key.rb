# == Schema Information
#
# Table name: api_keys
#
#  id          :uuid             not null, primary key
#  bearer_type :string           not null
#  name        :string           not null
#  token       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  bearer_id   :integer          not null
#
# Indexes
#
#  index_api_keys_on_bearer_id_and_bearer_type  (bearer_id,bearer_type)
#  index_api_keys_on_token                      (token) UNIQUE
#
class ApiKey < ApplicationRecord
  belongs_to :bearer, polymorphic: true
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  after_create_commit -> {
                          broadcast_prepend_later_to "api_keys",
                                                      partial: "api_keys/api_key",
                                                      locals: {
                                                        quote: self
                                                      },
                                                      target: "api_keys"
                          }
  after_update_commit -> { broadcast_replace_later_to "api_keys" }
  after_destroy_commit -> { broadcast_remove_to "api_keys" }
end
