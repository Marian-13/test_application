class PhotosController < ApplicationController
  class SortPhotosByLikes
    def initialize(photos)
      @photos = photos
    end

    def call(options={})
      # TODO
      array = @photos.sort_by { |photo| photo.likes.count }
      sorted_photos = @photos.replace(array)
      options[:reverse] ? sorted_photos.reverse : sorted_photos
    end
  end
end
