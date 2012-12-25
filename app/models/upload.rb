class Upload < ActiveRecord::Base
  attr_accessible :company_id, :name, :file_location
  has_one :company
  has_many :devices
  has_many :users, :through => :company
end
