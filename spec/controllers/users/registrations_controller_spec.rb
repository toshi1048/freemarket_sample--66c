require 'rails_helper'
describe Users::RegistrationsController do
  # let(:user) { create(:user) }
  describe 'GET #new' do
    it "renders the :new template" do
      # redirect_to root_path
      binding.pry
      # get :new
      redirect_to new_user_registration_path
      expect(response).to render_template :new
    end
  end
end
