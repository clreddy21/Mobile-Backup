class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :from_name
      t.string :to_name
      t.string :from_number
      t.string :to_number
      t.text :message
      t.date :date
      t.time :time
      t.references :mobile_number, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
