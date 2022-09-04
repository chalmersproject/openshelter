# typed: true
# frozen_string_literal: true

class AddDefaultFirstAndLastNamesToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.change_default :first_name, from: nil, to: ""
      t.change_default :last_name, from: nil, to: ""
    end
  end
end
