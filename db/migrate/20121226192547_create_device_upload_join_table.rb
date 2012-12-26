class CreateDeviceUploadJoinTable < ActiveRecord::Migration
  def chance
    create_table :devices_uploads, :id => false do |t|
      t.integer :device_id
      t.integer :upload_id
    end
  end

  def down
  end
end
