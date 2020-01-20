require 'rails_helper'
describe Card do
  describe '#create_card' do
    it "is invalid without a card" do
      user = build(:card, card_number: "")
      user.valid?
      expect(user.errors[:card_number]).to include("can't be blank")
    end

    it "is invalid without a card" do
      user = build(:card, year: "")
      user.valid?
      expect(user.errors[:year]).to include("can't be blank")
    end
    it "is invalid without a card" do
      user = build(:card, momth: "")
      user.valid?
      expect(user.errors[:momth]).to include("can't be blank")
    end
    it "is invalid without a card" do
      user = build(:card, security_number: "")
      user.valid?
      expect(user.errors[:security_number]).to include("can't be blank")
    end

  end
end