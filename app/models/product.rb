class Product < ApplicationRecord
  belongs_to :business
  belongs_to :category
end
