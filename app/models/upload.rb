class Upload < ActiveRecord::Base
  attr_accessible :company_id, :name, :file_location, :file_location_file_name, :os
  attr_accessor :file_location_file_name
  has_one :company
  has_many :devices
  has_many :users, :through => :company
  has_attached_file :os, :storage => :filesystem,
   :path => "uploads/paperclip_uploads/:attachment/:id/:style/:basename.:extension" 
  validates_attachment :os, :presence => true,
    :size => { :in => 0..10.gigabytes }
  # TODO: Add scope: 
  # scope :company, where(:company_id => User.company_id)
end
