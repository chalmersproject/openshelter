# typed: true
# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table(:users) do |t|
      t.string(:email, null: false)
      t.index(:email, unique: true)
      t.boolean(:email_verified, default: false, null: false)

      t.string(:password_hash, null: false)
      t.string(:password_salt, null: false)

      # Authlogic tokens:
      t.string(:persistence_token, null: false)
      t.index(:persistence_token, unique: true)
      t.string(:single_access_token, null: false)
      t.index(:single_access_token, unique: true)
      t.string(:perishable_token, null: false)
      t.index(:perishable_token, unique: true)

      # Authlogic magic columns:
      t.integer(:login_count, default: 0, null: false)
      t.integer(:failed_login_count, default: 0, null: false)
      t.datetime(:current_login_at)
      t.datetime(:last_login_at)
      t.string(:current_login_ip)
      t.string(:last_login_ip)

      # Authlogic: Used to disable a user.
      t.boolean(:active, default: true)

      # ActiveRecord magic columns:
      t.timestamps(null: false)
    end
  end
end
