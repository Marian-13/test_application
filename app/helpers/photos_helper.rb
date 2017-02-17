module PhotosHelper
  def tag_string_with_leading_hash(tag)
    TagStringWithLeadingHash.new(tag).call
  end

  def previous_page(current_page)
    (current_page - 1).to_s
  end

  def next_page(current_page)
    (current_page + 1).to_s
  end

  def previous_page_exists?(current_page)
    current_page - 1 >= 1
  end
end
