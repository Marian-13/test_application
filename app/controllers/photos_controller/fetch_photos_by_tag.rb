class PhotosController < ApplicationController
  class FetchPhotosByTag
    attr_reader :required_args

    def initialize(instagram_client, required_args = {})
      @instagram_client = instagram_client
      @required_args = required_args
    end

    def call(options = {})
      @instagram_client.tag_recent_media(@required_args[:tag].to_s, options)
    end
  end
end
