class Item < ApplicationRecord
  belongs_to :category
  belongs_to :bland
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
end
