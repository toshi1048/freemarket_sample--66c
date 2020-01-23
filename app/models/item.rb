class Item < ApplicationRecord
  belongs_to :category
  belongs_to :brand, optional: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  validates :name, :price, presence: true

  scope :category, -> (number){where(category_id: number)}
  scope :recent, -> {order('id DESC').limit(8)}
  scope :brand,  -> (number){where(brand_id: number)}
end
