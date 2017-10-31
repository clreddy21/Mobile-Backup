class AddGcmIdToMobileNumbers < ActiveRecord::Migration
  def change
    add_column :mobile_numbers, :gcm_id, :string
  end
end
