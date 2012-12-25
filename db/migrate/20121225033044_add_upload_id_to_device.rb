class AddUploadIdToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :upload_id, :integer
  end
end
