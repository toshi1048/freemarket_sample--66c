require 'rails_helper'

describe ItemsController, type: :controller do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    context 'can save' do
      it "is valid with content" do
        expect(build(:item)).to be_valid
        end
      end
end
end