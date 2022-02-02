# typed: strict
# frozen_string_literal: true

module Types
  class UserType < BaseObject
    global_id_field :id

    field :created_at, Types::DateTimeType, null: false
    field :updated_at, Types::DateTimeType, null: false

    field :email, String, null: false
    field :email_verified, Boolean, null: false

    field :current_login_at, Types::DateTimeType
    field :current_login_ip, String
    field :last_login_at, Types::DateTimeType
    field :last_login_ip, String
  end
end
