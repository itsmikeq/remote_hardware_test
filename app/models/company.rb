class Company < ActiveRecord::Base
  attr_accessible :name
  has_many :devices
  has_many :users
  # scope :by_device, lambda do |id|
    # joins(:devices).where('devices.company_id = ?', id) unless id.nil?
  # end

end
