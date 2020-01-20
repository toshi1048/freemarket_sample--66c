class Item < ApplicationRecord
  belongs_to :category
  belongs_to :bland
  has_many :images
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"

  scope :category, -> (number){where(category_id: number)}
  scope :recent, -> {order('id DESC').limit(4)}
  scope :brand,  -> (number){where(brand_id: number)}
end
