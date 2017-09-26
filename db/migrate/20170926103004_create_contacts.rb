class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :number
      t.string :name
      t.string :email
      t.references :mobile_number, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
