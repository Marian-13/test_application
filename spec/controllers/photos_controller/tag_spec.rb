require 'rails_helper'

class PhotosController < ApplicationController
  describe Tag do
    describe '#valid?' do
      context 'when tag is invalid' do
        let(:invalid_tag_string) { '#task' }

        it 'returns false' do
          tag = Tag.new(invalid_tag_string)

          expect(tag.valid?).to be false
        end
      end

      context 'when tag is valid (consists of only word characters)' do
        # http://rubular.com/
        let(:valid_tag_string) { 'task' }

        it 'returns true' do
          tag = Tag.new(valid_tag_string)

          expect(tag.valid?).to be true
        end
      end
    end

    describe '#to_s' do
      let(:tag_string) { 'tag' }

      it 'returns string representation' do
        string = Tag.new(tag_string).to_s

        expect(string).to eq(tag_string)
      end
    end
  end
end
