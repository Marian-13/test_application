class PhotosController < ApplicationController
  before_action :authorize_user
  before_action :set_tag, only: [:index]
  before_action :set_current_page, only: [:index]

  def index
    count = default_count

    if @tag.valid?
      options = HashWithNoNilValuesGenerator.new(
        count: count,
        max_tag_id: params[:next_max_tag_id]
      ).generate

      api_request = FetchPhotosByTag.new(instagram_client, tag: @tag)

      unique_key = CacheUniqueKeyGenerator.new.generate(
        api_request_type: 'photos',
        tag: @tag,
        count: count,
        current_page: @current_page
      )

      complex_request = ->(opts) {
        photos = api_request.call(opts)
        # In sandbox mode Instagram API always return one like per photo(media)
        photos = SortPhotosByLikes.new(photos).call(reverse: false)
      }

      @photos = CacheApiRequest.new(complex_request, options)
                               .call(unique_key, cache: default_cache)

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
      OpenStruct.new(pagination: OpenStruct.new)
    end

    def first_page
      1
    end

    def set_current_page
      pages = HashWithNoNilValuesGenerator.new(
        next_page: params[:next_page],
        previous_page: params[:previous_page]
      ).generate

      @current_page = if pages.empty?
                        first_page
                      else
                        pages[pages.keys.first].to_i
                      end
    end
end
