module PhotosHelper
  class TagStringWithLeadingHash
    def initialize(tag_string)
      @tag_string = tag_string
    end

    def call
      "##{@tag_string}"
    end
  end
end
