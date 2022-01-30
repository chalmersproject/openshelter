# typed: strict
# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: users
#
#  id                  :bigint           not null, primary key
#  active              :boolean          default(TRUE)
#  current_login_at    :datetime
#  current_login_ip    :string
#  email               :string           not null
#  failed_login_count  :integer          default(0), not null
#  last_login_at       :datetime
#  last_login_ip       :string
#  last_request_at     :datetime
#  login_count         :integer          default(0), not null
#  password_hash       :string           not null
#  password_salt       :string           not null
#  perishable_token    :string           not null
#  persistence_token   :string           not null
#  single_access_token :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_users_on_email                (email) UNIQUE
#  index_users_on_perishable_token     (perishable_token) UNIQUE
#  index_users_on_persistence_token    (persistence_token) UNIQUE
#  index_users_on_single_access_token  (single_access_token) UNIQUE
#
