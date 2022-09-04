# typed: true
# frozen_string_literal: true

class RemoveDefaultEmailAndPasswordFromUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.change_default :email, from: "", to: nil
      t.change_default :encrypted_password, from: "", to: nil
    end
  end
end
