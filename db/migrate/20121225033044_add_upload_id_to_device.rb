class AddUploadIdToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :upload_id, :integer
    add_index(:uploads, [ :name, :company_id ])

  end
end
