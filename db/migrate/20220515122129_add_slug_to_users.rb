# typed: true
# frozen_string_literal: true

class AddSlugToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :slug, :string, null: false
    add_index :users, :slug, unique: true
  end
end
