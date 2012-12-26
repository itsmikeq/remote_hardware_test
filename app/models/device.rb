class Device < ActiveRecord::Base
  attr_accessible :function, :name, :company_id, :upload_id
  has_one :company
  belongs_to :company
  # scope :by_user, lambda do |user|
    # joins(:companies).where('user.company_id = ?', user) unless user.nil?
  # end

end
