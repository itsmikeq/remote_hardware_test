class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :company_id, :as => [:admin, :device_admin]
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :company_id
  belongs_to :company
  has_many :devices, :through => :company
  has_many :uploads, :through => :company
  # scope :by_upload, lambda do |upload|
    # joins(:uploads).where('uploads.company_id = ?', upload) unless upload.nil?
  # end

end
