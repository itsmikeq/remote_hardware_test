class AddFileLocationToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :file_location, :string
  end
end
