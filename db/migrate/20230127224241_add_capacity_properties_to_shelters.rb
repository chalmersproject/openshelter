# typed: true
# frozen_string_literal: true

class AddCapacityPropertiesToShelters < ActiveRecord::Migration[7.0]
  def change
    add_column :shelters, :max_headcount, :integer, null: false, default: 0
    add_column :shelters, :max_bedcount, :integer, null: false, default: 0
  end
end
