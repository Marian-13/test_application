class PhotosController < ApplicationController
  class HashWithNoNilValuesGenerator
    def initialize(hash)
      @hash = hash
    end

    def generate
      @hash.compact
    end
  end
end
