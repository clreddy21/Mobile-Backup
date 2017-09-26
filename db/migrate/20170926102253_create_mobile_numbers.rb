class CreateMobileNumbers < ActiveRecord::Migration
  def change
    create_table :mobile_numbers do |t|
      t.string :number

      t.timestamps null: false
    end
  end
end
