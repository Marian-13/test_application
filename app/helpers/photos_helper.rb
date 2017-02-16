module PhotosHelper
  def tag_string_with_leading_hash(tag)
    TagStringWithLeadingHash.new(tag).call
  end
end
