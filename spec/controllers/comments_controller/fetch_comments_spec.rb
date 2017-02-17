require 'rails_helper'

class CommentsController < ApplicationController
  describe FetchComments do
    describe '#call' do
      let(:instagram_client) { Instagram.client(access_token: 'token') }
      let(:photo_id) { 1 }
      let(:response_body) { TestData.comments_response_body }

      it 'requests Instagram API for comments' do
        stub_request(:get, %r{api.instagram.com/v1/media/#{photo_id}/comments}).to_return(body: response_body)

        FetchComments.new(instagram_client, photo_id: photo_id).call

        expect(a_request(:get, %r{api.instagram.com/v1/media/#{photo_id}/comments})).to have_been_made
      end

      it 'returns comments' do
        stub_request(:get, %r{api.instagram.com/v1/media/#{photo_id}/comments}).to_return(body: response_body)

        comments = FetchComments.new(instagram_client, photo_id: photo_id).call

        expect(comments).not_to be_nil
      end
    end
  end
end
