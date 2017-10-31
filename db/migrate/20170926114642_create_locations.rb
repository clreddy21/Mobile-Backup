class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :latitude
      t.string :longitude
      t.date :date
      t.time :time
      t.references :mobile_number, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
