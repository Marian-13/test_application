class CommentsController < ApplicationController
  class FetchComments
    attr_reader :required_args

    def initialize(instagram_client, required_args = {})
      @instagram_client = instagram_client
      @required_args = required_args
    end

    def call(options = {})
      @instagram_client.media_comments(@required_args[:photo_id])
    end
  end
end
