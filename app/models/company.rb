class Company < ActiveRecord::Base
  attr_accessible :name
  has_many :devices
  has_many :users
  has_many :uploads
  # scope :by_device, lambda do |id|
    # joins(:devices).where('devices.company_id = ?', id) unless id.nil?
  # end
  scope :uploads, joins('join uploads on uploads.company_id = company.id')
    # {:conditions => ['company_id = ?', company]}
  
end
