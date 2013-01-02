class Device < ActiveRecord::Base
  attr_accessible :function, :name, :company_id, :upload_id, :uploads_attributes,
    :file, :script,:file_location, :file_location_file_name
  has_one :company
  belongs_to :company
  has_many :uploads
  attr_accessor :current_user, :workflow_upload, :uploads_attributes, 
    :file_location, :file_location_file_name, :file
  accepts_nested_attributes_for :uploads,:allow_destroy => true
end
