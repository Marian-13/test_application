require 'rails_helper'
require_relative 'test_data'

RSpec.describe InstagramController, type: :controller do
  let(:instagram_access_token) { 'fb2e77d.47a0479900504cb3ab4a1f626d174d2d' }

  describe 'GET #connect' do
    context 'when user not logged in via instagram' do
      it "redirects to Instagram login page" do
        get 'connect'

        # https://www.instagram.com/developer/authentication/
        expect(response.redirect_url).to match(%r{api.instagram.com/oauth})
      end
    end

    context 'when user logged in via instagram' do
      before(:example) do
        get('connect', session: { instagram_access_token: instagram_access_token })
      end

      it 'sets flash notice' do
        expect(flash[:notice]).not_to be_nil
      end

      it 'redirects to photos' do
        expect(response).to redirect_to(photos_path)
      end
    end
  end

  describe 'GET #callback' do
    context 'when user logged in via instagram' do
      before(:example) do
        get('callback', session: { instagram_access_token: instagram_access_token })
      end

      it 'sets flash notice' do
        expect(flash[:notice]).not_to be_nil
      end

      it 'redirects to photos' do
        expect(response).to redirect_to(photos_path)
      end
    end

    context 'when user not logged in via instagram' do
      let(:response_body) { TestData.instagram_response_body(instagram_access_token) }

      before(:example) do
        stub_request(:any, /api.instagram.com/).to_return(body: response_body)
      end

      it 'sets session instagram_access_token to access token' do
        code = 'code returned by redirect from connect'

        get('callback', params: { code: code })

        expect(session[:instagram_access_token]).to eq(instagram_access_token)
      end

      it 'redirects to photos' do
        get('callback')

        expect(response).to redirect_to(photos_path)
      end
    end
  end

  describe 'POST #disconnect' do
    context 'when user not logged in via instagram' do
      it 'redirects to root' do
        get 'disconnect'

        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user logged in via instagram' do
      it 'sets session instagram_access_token to nil' do
        get('disconnect', session: { instagram_access_token: instagram_access_token })

        expect(session[:instagram_access_token]).to be_nil
      end

      it 'redirects to root' do
        get('disconnect', session: { instagram_access_token: instagram_access_token })

        expect(response).to redirect_to(root_path)
      end
    end
  end
end
