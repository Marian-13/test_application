require 'rails_helper'

module PhotosHelper
  describe TagWithLeadingHash do
    describe '#call' do
      it 'returns tag with leading hash sign' do
        tag = 'task'
        tagWithLeadingHash = TagWithLeadingHash.new(tag)

        expect(tagWithLeadingHash.call).to match(/^#/)
      end
    end
  end
end
