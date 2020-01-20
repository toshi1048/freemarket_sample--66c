require 'rails_helper'
describe PhoneNumber do
  describe '#create_tel' do
    it "is invalid without a phone_number" do
      user = build(:phone_number, phone_number: "")
      user.valid?
      expect(user.errors[:phone_number]).to include("can't be blank")
    end
  end
end