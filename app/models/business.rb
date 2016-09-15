class Business < ApplicationRecord
	belongs_to :user
	validates :name, :user_id, presence: :true
	has_many :products
	geocoded_by :address
  	after_validation :geocode

	mount_uploader :logo, LogoUploader
end
