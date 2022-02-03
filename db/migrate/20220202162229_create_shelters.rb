# typed: true
# frozen_string_literal: true

class CreateShelters < ActiveRecord::Migration[7.0]
  def change
    create_table :shelters do |t|
      t.string :name, null: false
      t.index :name, unique: true

      t.string :phone, :email
      t.index :phone
      t.index :email

      t.string :address

      t.timestamps
    end
  end
end
