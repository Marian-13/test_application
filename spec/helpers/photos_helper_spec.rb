require 'rails_helper'

RSpec.describe PhotosHelper, type: :helper do
  describe '#tag_string_with_leading_hash' do
    let(:tag_string) { 'task' }

    it 'returns tag string with leading hash sign' do
      expect(helper.tag_string_with_leading_hash(tag_string)).to match(/^#/)
    end
  end
end
