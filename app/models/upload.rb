class Upload < ActiveRecord::Base
  attr_accessible :company_id, :name, :file_location, :file_location_file_name, :os
  # Virtual attributes
  attr_accessor :file_location_file_name, :file_location
  # has_one :company
  has_and_belongs_to_many :devices
  has_many :users #, :through => :company
  belongs_to :company
  has_attached_file :os, :storage => :filesystem,
   :path => "uploads/paperclip_uploads/:attachment/:id/:style/:basename.:extension"
  validates_attachment :os,
    :size => { :in => 0..10.gigabytes }
  # TODO: Add scope for by device:
  # scope :by_company, (lambda do |company|
    # # joins(:companies).where('uploads.company_id = ?', company) unless company.nil?
    # {:conditions => ['company_id = ?', company]}
  # end)
  # scope :by_user, (lambda do |company_id| 
    # joins(:users).where("users.company_id = ?", company_id) unless company_id.nil?
  # end)
  after_save :check_and_get_http_file, :on => :create
  
  private
  def check_and_get_http_file
    if Rails.env == "development"
      puts "Will call download on #{self.name} here if self.file_location like http(s)/ftp/etc."
    end
  end
end

