class Card < ApplicationRecord
  belongs_to :user, optional: true
  validates :card_number, :year, :momth, :security_number,presence: true
  validates :card_number, length: {minimum: 16, maximum:16}
  validates :security_number, length: {minimum: 3, maximum:4}
end
