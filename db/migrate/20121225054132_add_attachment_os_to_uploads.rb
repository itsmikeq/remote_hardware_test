class AddAttachmentOsToUploads < ActiveRecord::Migration
  def self.up
    change_table :uploads do |t|
      t.attachment :os
    end
  end

  def self.down
    drop_attached_file :uploads, :os
  end
end
