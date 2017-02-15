require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  it { is_expected.to use_before_action(:authorize_user) }

  describe 'GET #index' do
    let(:photo_id) { 1 }
    let(:instagram_access_token) { 'token' }

    it 'requests Instagram API for comments' do
      stub_request(:get, %r{api.instagram.com/v1/media/#{photo_id}/comments}).to_return(body: responce_body)

      get(:index,
          params: { photo_id: photo_id },
          session: { instagram_access_token: instagram_access_token },
          xhr: true)

      expect(a_request(:get, %r{api.instagram.com/v1/media/#{photo_id}/comments})).to have_been_made
    end

    it 'responds to js format' do
      stub_request(:any, /api.instagram.com/).to_return(body: responce_body)

      get(:index,
          params: { photo_id: photo_id },
          session: { instagram_access_token: instagram_access_token },
          xhr: true)

      expect(response.content_type).to eq "text/javascript"
    end
  end
end

def responce_body
  <<-HEREDOC
    {
      "data": [
        {
          "created_time": "1280780324",
          "text": "Really amazing photo!",
          "from": {
            "username": "snoopdogg",
            "profile_picture": "http://images.instagram.com/profiles/profile_16_75sq_1305612434.jpg",
            "id": "1574083",
            "full_name": "Snoop Dogg"
          },
        "id": "420"
        }
      ]
    }
  HEREDOC
end
