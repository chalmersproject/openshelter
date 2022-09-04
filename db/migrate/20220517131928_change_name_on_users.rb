# typed: true
# frozen_string_literal: true

class ChangeNameOnUsers < ActiveRecord::Migration[7.0]
  def change
    reversible { |dir| dir.up { execute("TRUNCATE TABLE users") } }

    change_table :users do |t|
      t.string :display_name, null: false, default: ""
      t.string :first_name, null: false
      t.string :last_name, null: false
    end
  end
end
