# typed: true
# frozen_string_literal: true

class AddOmniauthToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :omniauth_provider, :string
    add_column :users, :omniauth_uid, :string
    add_index :users,
              %i[omniauth_provider omniauth_uid],
              name: :index_users_omniauth_uniqueness,
              unique: true
  end
end
