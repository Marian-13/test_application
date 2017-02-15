module PhotosHelper
  class TagWithLeadingHash
    def initialize(tag)
      @tag = tag
    end

    def call
      "##{@tag}"
    end
  end
end
