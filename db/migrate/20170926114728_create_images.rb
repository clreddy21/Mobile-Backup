class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :image
      t.string :name
      t.date :date
      t.time :time
      t.references :mobile_number, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
