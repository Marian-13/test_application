require 'rails_helper'

RSpec.describe PhotosHelper, type: :helper do
  describe '#tag_with_leading_hash' do
    it 'returns tag with leading hash sign' do
      tag = 'task'
      tag_with_leading_hash = helper.tag_with_leading_hash(tag)

      expect(tag_with_leading_hash).to match(/^#/)
    end
  end
end
