require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    context 'when user not logged in via instagram' do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    context 'when user logged in via instagram' do
      it 'redirects to photos' do
        get(:index, session: { instagram_access_token: 'token' })
        expect(response).to redirect_to(photos_path)
      end
    end
  end
end
