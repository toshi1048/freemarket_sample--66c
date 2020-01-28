class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :zipcode, :prefecture, :first_address, :second_address, presence: true
  
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture
end
