module TestData
  module_function

  def instagram_response_body(instagram_access_token)
    # https://www.instagram.com/developer/authentication/
    <<-HEREDOC
    {
      "access_token": "#{instagram_access_token}",
        "user": {
          "id": "1574083",
          "username": "snoopdogg",
          "full_name": "Snoop Dogg"
        }
    }
    HEREDOC
  end

  def photos_response_body_with_photos
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

  def photos_response_body_without_photos
    <<-HEREDOC
    {
      "data": []
    }
    HEREDOC
  end

  def comments_response_body
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
end
