# typed: true
# frozen_string_literal: true

class AddMetadataToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :metadata, :jsonb, null: false, default: {}
  end
end
