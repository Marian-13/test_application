class PhotosController < ApplicationController
  class Tag
    TAG_VALIDITY_REGEX = /^\w+$/

    def initialize(tag)
      @tag = tag.downcase
    end

    def valid?
      @tag =~ TAG_VALIDITY_REGEX
    end

    def to_s
      @tag
    end
  end
end
