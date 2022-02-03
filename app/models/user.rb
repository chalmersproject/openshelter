# typed: strict
# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                  :bigint           not null, primary key
#  active              :boolean          default(TRUE)
#  current_login_at    :datetime
#  current_login_ip    :string
#  email               :string           not null
#  email_verified      :boolean          default(FALSE), not null
#  failed_login_count  :integer          default(0), not null
#  last_login_at       :datetime
#  last_login_ip       :string
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

# TODO: Create a custom email type?
class User < ApplicationRecord
  extend T::Sig

  # Users with these domains are considered admins.
  ADMIN_DOMAINS =
    T.let(%w[chalmers.cards chalmersproject.com], T::Array[String])

  acts_as_authentic do |config|
    # Configure Authlogic.
    #
    # See:
    # https://github.com/binarylogic/authlogic
    # https://www.rubydoc.info/github/binarylogic/authlogic

    config.crypto_provider = Authlogic::CryptoProviders::SCrypt
  end

  validates :email,
            presence: true,
            length: {
              maximum: 100,
            },
            email: {
              mode: :strict,
              require_fqdn: true,
            },
            uniqueness: {
              case_sensitive: false,
              if: :will_save_change_to_email?,
            }

  validates :password,
            presence: true,
            length: {
              minimum: 8,
            },
            confirmation: true,
            if: :require_password?

  validates :password_confirmation,
            presence: true,
            length: {
              minimum: 8,
            },
            if: :require_password?

  rails_admin do
    base do
      exclude_fields :password_hash, :password_salt
      exclude_fields :persistence_token, :perishable_token, :single_access_token

      # field :id do
      #   label "ID"
      # end
      field :current_login_ip do
        label "Current login IP"
      end
      field :last_login_ip do
        label "Current login IP"
      end
    end
    edit do
      exclude_fields :login_count, :failed_login_count
      exclude_fields :current_login_at, :current_login_ip
      exclude_fields :last_login_at, :last_login_ip
    end
  end

  sig { returns(T::Boolean) }
  def admin?
    ADMIN_DOMAINS.any? { |domain| email.end_with?("@#{domain}") }
  end
end
