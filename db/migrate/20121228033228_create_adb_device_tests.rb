class CreateAdbDeviceTests < ActiveRecord::Migration
  def change
    create_table :adb_device_tests do |t|
      t.string :name
      t.text :script
      t.integer :device_id
      t.integer :upload_id
      t.integer :company_id

      t.timestamps
    end
  end
end
