require 'rails_helper'

module PhotosHelper
  describe TagStringWithLeadingHash do
    describe '#call' do
      let(:tag_string) { 'task' }

      it 'returns tag string with leading hash sign' do
        tag_sring_with_leading_hash = TagStringWithLeadingHash.new(tag_string)

        expect(tag_sring_with_leading_hash.call).to match(/^#/)
      end
    end
  end
end
