# typed: true
# frozen_string_literal: true

class CreateShelters < ActiveRecord::Migration[7.0]
  def change
    create_table :shelters, id: :uuid do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :slug, null: false
      t.string :contact_email
      t.string :contact_phone, null: false
      t.geometry :location, geographic: true, srid: 4326
      t.string :tags, array: true, null: false, default: []
      t.string :website_url

      t.timestamps
    end

    add_index :shelters, :slug, unique: true
    add_index :shelters, :contact_email, unique: true
    add_index :shelters, :contact_phone, unique: true
  end
end
