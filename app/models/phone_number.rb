class PhoneNumber < ApplicationRecord
  belongs_to :user, optional: true
  validates :phone_number, length: {minimum: 11, maximum:11},presence: true
end
