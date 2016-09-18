class Product < ApplicationRecord
  belongs_to :business
  belongs_to :category
  validates :name, :business_id, :category_id, presence: :true
  

  scope :highlighted, -> {where(highlighted: true)}

  mount_uploader :photo, PhotoUploader


end
