require 'rails_helper'

class PhotosController < ApplicationController
  describe OptionsGenerator do
    describe '#generate' do
      it 'returns hash with no nil values' do
        options = OptionsGenerator.new(
          count: 5,
          min_tag_id: nil,
          max_tag_id: nil
        ).generate

        expect(options).not_to include(min_tag_id: nil, max_tag_id: nil)
      end
    end
  end
end
