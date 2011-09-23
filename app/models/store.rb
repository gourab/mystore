class Store < ActiveRecord::Base
  belongs_to :user
  has_many :assets, :as => :attachable, :dependent => :destroy
  Max_Attachments = 1
	#validate :validate_attachments
 has_attached_file :avatar,:styles => { :medium => "300x300>", :thumb => "100x100>" }
end
