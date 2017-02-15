class PhotosController < ApplicationController
  class OptionsGenerator
    def initialize(options)
      @options = options
    end

    def generate
      @options.compact
    end
  end
end
