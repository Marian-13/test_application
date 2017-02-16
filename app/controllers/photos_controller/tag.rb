class PhotosController < ApplicationController
  class Tag
    TAG_VALIDITY_REGEX = /^\w+$/

    def initialize(tag_string)
      @tag_string = tag_string.downcase
    end

    def valid?
      if @tag_string =~ TAG_VALIDITY_REGEX
        true
      else
        false
      end
    end

    def to_s
      @tag_string
    end
  end
end
