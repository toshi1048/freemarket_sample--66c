require 'rails_helper'

describe Item, type: :model do
  describe '#create' do
    let(:item) {create(:item)}

    context 'can save' do

      it "is valid with content" do
        expect(build(:item)).to be_valid
        end

      it 'is valid without brand_id' do
        expect(build(:item, brand_id: nil)).to be_valid
      end

      it 'is valid without detail' do
        expect(build(:item, detail: nil)).to be_valid
      end
      it 'is valid without buyer_id' do
        expect(build(:item, buyer_id: nil)).to be_valid
      end
    end
    context 'can not save' do
      
      it 'is invalid without name' do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end
      it 'is invalid without price' do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("can't be blank")
      end
    end
  end
end