class CreateShelterMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :shelter_measurements, id: :uuid do |t|
      t.string :type, null: false, index: true
      t.integer :value, null: false, index: true
      t.belongs_to :shelter, null: false, foreign_key: true, type: :uuid
      t.belongs_to :signal, null: false, foreign_key: { to_table: "shelter_signals" }, type: :uuid
      t.timestamptz :created_at, null: false, index: true
    end
  end
end
