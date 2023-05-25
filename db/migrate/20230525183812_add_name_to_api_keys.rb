# typed: true
# frozen_string_literal: true

class AddNameToApiKeys < ActiveRecord::Migration[7.0]
  def change
    add_column :api_keys, :name, :string, null: false
  end
end
