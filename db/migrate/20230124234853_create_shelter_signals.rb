class CreateShelterSignals < ActiveRecord::Migration[7.0]
  def change
    create_table :shelter_signals, id: :uuid do |t|
      t.string :type, null: false, index: true
      t.belongs_to :shelter, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
