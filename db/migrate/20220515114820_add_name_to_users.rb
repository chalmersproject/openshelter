# typed: true
# frozen_string_literal: true

class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false
    add_index :users, :name
  end
end
