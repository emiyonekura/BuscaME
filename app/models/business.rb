class Business < ApplicationRecord
	belongs_to :user
	validates :name, :user_id, presence: :true
	has_many :products
end
