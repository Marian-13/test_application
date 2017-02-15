require 'rails_helper'

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

      it 'requests Instagram API for photos' do
        stub_request(:get, %r{api.instagram.com/v1/tags/#{tag}/media/recent})
          .to_return(body: responce_body_with_photos)

        custom_get(tag)

        expect(a_request(:get, %r{api.instagram.com/v1/tags/#{tag}/media/recent}))
          .to have_been_made
      end

      it 'returns http success' do
        stub_request(:any, /api.instagram.com/).to_return(body: responce_body_with_photos)

        custom_get(tag)

        expect(response).to have_http_status(:success)
      end

      context 'when no photos found' do
        # No photos tagged with 'task11' in sandbox mode
        let(:tag) { 'task11' }

        it 'sets flash alert' do
          stub_request(:any, /api.instagram.com/).to_return(body: responce_body_without_photos)

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

def responce_body_with_photos
  <<-HEREDOC
  {
    "data": [{
      "type": "image",
      "users_in_photo": [],
      "filter": "Earlybird",
      "tags": ["snow"],
      "comments": {
        "count": 3
      },
      "caption": {
        "created_time": "1296703540",
        "text": "#Snow",
        "from": {
          "username": "emohatch",
          "id": "1242695"
        },
        "id": "26589964"
      },
      "likes": {
        "count": 1
      },
      "link": "http://instagr.am/p/BWl6P/",
      "user": {
        "username": "emohatch",
        "profile_picture": "http://distillery.s3.amazonaws.com/profiles/profile_1242695_75sq_1293915800.jpg",
        "id": "1242695",
        "full_name": "Dave"
      },
      "created_time": "1296703536",
      "images": {
          "low_resolution": {
            "url": "http://distillery.s3.amazonaws.com/media/2011/02/02/f9443f3443484c40b4792fa7c76214d5_6.jpg",
            "width": 306,
            "height": 306
        },
        "thumbnail": {
          "url": "http://distillery.s3.amazonaws.com/media/2011/02/02/f9443f3443484c40b4792fa7c76214d5_5.jpg",
          "width": 150,
          "height": 150
        },
        "standard_resolution": {
          "url": "http://distillery.s3.amazonaws.com/media/2011/02/02/f9443f3443484c40b4792fa7c76214d5_7.jpg",
          "width": 612,
          "height": 612
        }
      },
      "id": "22699663",
      "location": null
    }]
  }
  HEREDOC
end

def responce_body_without_photos
  <<-HEREDOC
  {
    "data": []
  }
  HEREDOC
end
