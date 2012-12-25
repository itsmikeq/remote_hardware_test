class Device < ActiveRecord::Base
  attr_accessible :function, :name, :company_id, :upload_id
  belongs_to :company
end
