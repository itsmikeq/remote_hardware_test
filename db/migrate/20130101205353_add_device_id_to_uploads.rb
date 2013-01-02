class AddDeviceIdToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :device_id, :integer
  end
end
