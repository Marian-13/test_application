require 'rails_helper'

class PhotosController < ApplicationController
  describe FetchPhotosByTag do
    describe '#call' do
      let(:tag) { 'task' }
      let(:instagram_client) { Instagram.client(access_token: 'token') }
      let(:response_body_with_photos) { TestData.photos_response_body_with_photos }

      it 'requests Instagram API for photos' do
        stub_request(:get, %r{api.instagram.com/v1/tags/#{tag}/media/recent})
          .to_return(body: response_body_with_photos)

        FetchPhotosByTag.new(instagram_client, tag: tag).call

        expect(a_request(:get, %r{api.instagram.com/v1/tags/#{tag}/media/recent})).to have_been_made
      end

      it 'returns photos' do
        stub_request(:get, %r{api.instagram.com/v1/tags/#{tag}/media/recent}).to_return(body: response_body_with_photos)

        photos = FetchPhotosByTag.new(instagram_client, tag: tag).call

        expect(photos).not_to be_nil
      end
    end
  end
end
