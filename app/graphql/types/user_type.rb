# typed: strict
# frozen_string_literal: true

module Types
  class UserType < BaseObject
    global_id_field :id

    field :confirmed_at, DateTimeType, null: true
    field :created_at, DateTimeType, null: false
    field :updated_at, DateTimeType, null: false

    field :email, String, null: false
    field :unconfirmed_email, String, null: true

    field :current_sign_in_at, DateTimeType, null: true
    field :current_sign_in_ip, String, null: true
    field :last_sign_in_at, DateTimeType, null: true
    field :last_sign_in_ip, String, null: true
    field :sign_in_count, Integer, null: false
  end
end
