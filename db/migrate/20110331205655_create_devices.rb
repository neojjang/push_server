class CreateDevices < ActiveRecord::Migration
  def self.up
    create_table :devices do |t|
      t.string :device_type
      t.string :registration_id
      t.string :mobile_uuid

      t.timestamps
    end
  end

  def self.down
    drop_table :devices
  end
end
