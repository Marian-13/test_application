class CommentsController < ApplicationController
  before_action :authorize_user

  def index
    api_request = FetchComments.new(instagram_client, photo_id: params[:photo_id])

    unique_key =
      ApplicationController::CacheUniqueKeyGenerator.new(api_request).generate

    @comments =
      ApplicationController::CacheApiRequest.new(api_request).call(unique_key, cache: 15)

    respond_to do |format|
      format.js
    end
  end
end
