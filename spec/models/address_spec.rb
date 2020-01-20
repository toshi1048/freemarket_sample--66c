require 'rails_helper'
describe Address do
  describe '#create_address' do

    it "is invalid without a zipcode" do
      user = build(:address, zipcode: "")
      user.valid?
      expect(user.errors[:zipcode]).to include("can't be blank")
    end

    it "is invalid without a prefecture" do
      user = build(:address, prefecture: "")
      user.valid?
      expect(user.errors[:prefecture]).to include("can't be blank")
    end

    it "is invalid without a first_address" do
      user = build(:address, first_address: "")
      user.valid?
      expect(user.errors[:first_address]).to include("can't be blank")
    end

    it "is invalid without a second_address" do
      user = build(:address, second_address: "")
      user.valid?
      expect(user.errors[:second_address]).to include("can't be blank")
    end
    it "is invalid without a third_address" do
      user = build(:address, third_address: "")
      user.valid?
      expect(user.errors[:third_address]).to include("can't be blank")
    end

  end
end