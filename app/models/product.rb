class Product < ApplicationRecord
  belongs_to :business
  validates :name, :business_id, presence: :true
  belongs_to :category

  scope :highlighted, -> {where(highlighted: true)}

end
