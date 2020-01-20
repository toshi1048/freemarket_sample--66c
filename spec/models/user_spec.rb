require 'rails_helper'
describe User do
  describe '#create' do

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    it "is invalid without an email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a 名前" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    it "is invalid without an 苗字" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid without a 振り仮名" do
      user = build(:user, first_name_rattle: "")
      user.valid?
      expect(user.errors[:first_name_rattle]).to include("can't be blank")
    end
    pcreate
    it "is invalid without a 振り仮名" do
      user = build(:user, last_name_rattle: "")
      user.valid?
      expect(user.errors[:last_name_rattle]).to include("can't be blank")
    end
    it "is invalid without an 生年" do
      user = build(:user, birthyear: "")
      user.valid?
      expect(user.errors[:birthyear]).to include("can't be blank")
    end

    it "is invalid without a 月" do
      user = build(:user, birthmonth: "")
      user.valid?
      expect(user.errors[:birthmonth]).to include("can't be blank")
    end
    it "is invalid without an 日" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

  end
end