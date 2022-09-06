# typed: strict
# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  display_name           :string           default(""), not null
#  email                  :string           not null
#  encrypted_password     :string           not null
#  first_name             :string           default(""), not null
#  invitation_accepted_at :datetime
#  invitation_created_at  :datetime
#  invitation_limit       :integer
#  invitation_sent_at     :datetime
#  invitation_token       :string
#  last_name              :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  metadata               :jsonb            not null
#  name                   :string           not null
#  omniauth_provider      :string
#  omniauth_uid           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  slug                   :string           not null
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  invited_by_id          :uuid
#
# Indexes
#
#  index_users_omniauth_uniqueness      (omniauth_provider,omniauth_uid) UNIQUE
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_invitation_token      (invitation_token) UNIQUE
#  index_users_on_name                  (name)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (invited_by_id => users.id)
#

class User < ApplicationRecord
  extend T::Sig

  ADMIN_EMAILS =
    T.let(%w[hulloitskai@gmail.com zachary.donsky@gmail.com], T::Array[String])
  ADMIN_EMAIL_DOMAINS =
    T.let(
      %w[chalmersproject.com chalmerscards.com chalmers.cards],
      T::Array[String],
    )

  sig { returns(User) }
  def self.example
    User.new(email: "example@example.com", first_name: "Jon", last_name: "Snow")
  end

  # == Associations ==
  has_one_attached :avatar
  has_rich_text :bio

  references :invited_by, class_name: "User", inverse_of: :invited_users
  has_many :invited_users,
           class_name: "User",
           inverse_of: :invited_by,
           foreign_key: :invited_by_id,
           dependent: :nullify

  # == Validations: Naming ==
  validates :first_name,
            presence: true,
            length: {
              maximum: 64,
            },
            unless: -> {
              T.bind(self, User)
              new_record? && invited_to_sign_up?
            }
  validates :last_name,
            presence: true,
            length: {
              maximum: 64,
            },
            unless: -> {
              T.bind(self, User)
              new_record? && invited_to_sign_up?
            }
  validates :display_name, length: { maximum: 64 }

  # == Validations ==
  validates :slug, uniqueness: { case_sensitive: false }
  validates :email,
            presence: true,
            length: {
              maximum: 100,
            },
            email: true,
            uniqueness: {
              case_sensitive: false,
            }
  validates :avatar,
            content_type: %r{\Aimage\/.*\z},
            size: {
              less_than_or_equal_to: 25.megabytes,
            }

  # == Callbacks ==
  before_validation :set_name

  # == Concerns ==
  include Identifiable
  include ::Named
  include Routable
  include Slugged

  # == Setters ==
  sig { override.params(value: String).returns(String) }
  def email=(value)
    super(value.strip.downcase)
  end

  sig { params(attachable: T.untyped).returns(T.untyped) }
  def avatar=(attachable)
    super(attachable.presence)
  end

  # == Methods: Naming ==
  sig { returns(String) }
  def full_name
    "#{first_name} #{last_name}"
  end

  sig { returns(String) }
  def first_initial
    first_name.gsub(/[^\w ]/, "").first
  end

  sig { returns(String) }
  def last_initial
    last_name.gsub(/[^\w ]/, "").first
  end

  sig { returns(String) }
  def initials
    first_initial + last_initial
  end

  # == Methods: Integrations ==
  sig { returns(T::Hash[String, T.untyped]) }
  def honeybadger_context
    { "user_id" => id, "user_email" => email }
  end

  sig { returns(T::Hash[String, T.untyped]) }
  def fullstory_identity
    { "uid" => id, "email" => email, "displayName" => name }
  end

  # == Methods ==
  sig { returns(T::Boolean) }
  def admin?
    email.in?(ADMIN_EMAILS) || email_domain.in?(ADMIN_EMAIL_DOMAINS)
  end

  sig { returns(String) }
  def email_domain
    domain = email.split("@").last
    T.must(domain)
  end

  private

  # == Helpers: Naming ==
  sig { returns(T.nilable(String)) }
  def generate_name
    display_name.presence || generate_display_name.presence || email
  end

  sig { returns(String) }
  def generate_display_name
    if first_name.present? && last_initial.present?
      "#{first_name} #{last_initial}."
    else
      ""
    end
  end

  # == Callbacks ==
  sig { void }
  def set_name
    generate_name.try { |name| self.name = name }
  end
end

# == FriendlyId ==
class User
  include FriendlyId::Concern

  friendly_id :name
end

# == Devise ==
class User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable,
         :database_authenticatable,
         :invitable,
         :omniauthable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         omniauth_providers: %i[google facebook]

  sig { params(auth: OmniAuth::AuthHash).returns(User) }
  def self.from_omniauth(auth)
    info = T.let(auth[:info], OmniAuth::AuthHash::InfoHash)
    user =
      scoped do
        u =
          User
            .where(omniauth_provider: auth[:provider], omniauth_uid: auth[:uid])
            .or(User.where(email: info[:email]))
            .first
        T.let(u, T.nilable(User))
      end
    if user.nil?
      user =
        User.new(
          omniauth_provider: auth[:provider],
          omniauth_uid: auth[:uid],
          **info.slice(:first_name, :last_name, :email),
        )
      if info.key?(:image)
        url = URI.parse(T.let(info[:image], String))
        url.path.try do |path|
          path = T.let(path, String)
          filename = File.basename(path)
          file = T.unsafe(url).open
          user.avatar.attach(io: file, filename: filename)
        end
      end
      user.password = Devise.friendly_token
      user.skip_confirmation!
      user.save!
    elsif !user.omniauth_provider?
      user.update!(omniauth_provider: auth[:provider], omniauth_uid: auth[:uid])
    end
    user
  end

  # == Validations ==
  validates :omniauth_uid,
            uniqueness: {
              scope: :omniauth_provider,
            },
            allow_nil: true

  # == Callbacks ==
  before_update :clear_legacy_password_salt, if: :encrypted_password_changed?

  # == Methods ==
  sig { returns(T::Boolean) }
  def from_omniauth?
    omniauth_provider?
  end

  sig { override.returns(T::Boolean) }
  def send_password_change_notification?
    super && !invited_to_sign_up?
  end

  protected

  # == Callbacks ==
  sig { override.void }
  def after_confirmation
    # send_registration_email
  end
end
