class Card < ApplicationRecord
  belongs_to :user, optional: true
  validates :card_number, :year, :momth, :security_number,presence: true
end
