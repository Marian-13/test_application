require 'rails_helper'

class CommentsController do
  describe FetchComments do
    describe '#call' do
      it 'requests Instagram API for comments' do
        stub_request(:get, %r{})
      end

      it 'returns comments'
    end
  end
end
