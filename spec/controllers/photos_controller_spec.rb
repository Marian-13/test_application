require 'rails_helper'
require_relative 'test_data'

RSpec.describe PhotosController, type: :controller do
  it { is_expected.to use_before_action(:authorize_user) }

  describe 'GET #index' do
    let(:instagram_access_token) { 'token' }

    def custom_get(tag)
      get(
        :index,
        params: { tag: tag },
        session: { instagram_access_token: instagram_access_token }
      )
    end

    context 'when tag is valid' do
      # At least 20 photos tagged with 'task' in sandbox mode
      let(:tag) { 'task' }
      let(:response_body_with_photos) { TestData.photos_response_body_with_photos }

      it 'requests Instagram API for photos' do
        stub_request(:get, %r{api.instagram.com/v1/tags/#{tag}/media/recent})
          .to_return(body: response_body_with_photos)

        custom_get(tag)

        expect(a_request(:get, %r{api.instagram.com/v1/tags/#{tag}/media/recent}))
          .to have_been_made
      end

      it 'returns http success' do
        stub_request(:any, /api.instagram.com/).to_return(body: response_body_with_photos)

        custom_get(tag)

        expect(response).to have_http_status(:success)
      end

      context 'when no photos found' do
        # No photos tagged with 'task11' in sandbox mode
        let(:tag) { 'task11' }
        let(:response_body_without_photos) { TestData.photos_response_body_without_photos }

        it 'sets flash alert' do
          stub_request(:any, /api.instagram.com/).to_return(body: response_body_without_photos)

          custom_get(tag)

          expect(flash[:alert]).not_to be_nil
        end
      end

      context 'when some photos found' do
      end
    end

    context 'when tag is invalid' do
      it 'sets flash alert' do
        invalid_tag = '#task'

        custom_get(invalid_tag)

        expect(flash[:alert]).not_to be_nil
      end
    end
  end
end
