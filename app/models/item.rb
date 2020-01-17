class Item < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  belongs_to :bland
  has_many :images
  
end
