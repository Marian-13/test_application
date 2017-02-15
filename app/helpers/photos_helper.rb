module PhotosHelper
  def tag_with_leading_hash(tag)
    TagWithLeadingHash.new(tag).call
  end
end
