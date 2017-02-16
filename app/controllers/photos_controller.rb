class PhotosController < ApplicationController
  before_action :authorize_user
  before_action :set_tag, only: [:index]

  def index
    if @tag.valid?
      options = OptionsGenerator.new(
        count: default_count,
        min_tag_id: params[:min_tag_id],
        max_tag_id: params[:max_tag_id]
      ).generate

      api_request = FetchPhotosByTag.new(instagram_client, tag: @tag)

      unique_key =
        ApplicationController::CacheUniqueKeyGenerator.new(api_request, options).generate

      complex_request = ->(opts) {
        photos = api_request.call(opts)
        # In sandbox mode Instagram API always return one like per photo(media)
        photos = SortPhotosByLikes.new(photos).call(reverse: false)
      }

      @photos =
        ApplicationController::CacheApiRequest.new(complex_request, options).call(unique_key, cache: default_cache)

      flash[:alert] = if @photos.empty?
                        'No photos with specified tag found...'
                      else
                        nil
                      end
    else
      @photos = no_photos

      flash[:alert] = 'Tag invalid format. Only single word allowed.'
    end
  end

  private
    def set_tag
      @tag = if params[:tag].blank?
               default_tag
             else
               Tag.new(params[:tag])
             end
    end

    def default_tag
      Tag.new('task')
    end
    helper_method :default_tag

    def default_count
      5
    end

    def default_cache
      # 15.minutes
      15 * 60
    end

    def no_photos
      photos = OpenStruct.new
      photos.pagination = OpenStruct.new

      photos
    end
end
