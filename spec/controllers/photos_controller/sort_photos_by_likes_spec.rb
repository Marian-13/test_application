require 'rails_helper'

class PhotosController < ApplicationController
  describe SortPhotosByLikes do
    describe '#call' do
      let(:photos) {
        photos = []
        photos << Photo.new(Likes.new(3))
        photos << Photo.new(Likes.new(4))
        photos << Photo.new(Likes.new(2))
        photos << Photo.new(Likes.new(5))
        photos << Photo.new(Likes.new(1))
      }

      context 'when :reverse option not passed' do
        it 'sorts photos in ascending order' do
          sorted_photos = SortPhotosByLikes.new(photos).call

          counts = sorted_photos.map { |photo| photo.likes.count }

          expect(counts).to eq [1, 2, 3, 4, 5]
        end
      end

      context 'when :reverse option passed with true' do
        it 'sorts photos in descending order' do
          sorted_photos = SortPhotosByLikes.new(photos).call(reverse: true)

          counts = sorted_photos.map { |photo| photo.likes.count }

          expect(counts).to eq [5, 4, 3, 2, 1]
        end
      end
    end
  end
end

class PhotosController::Photo
  attr_reader :likes

  def initialize(likes = nil)
    @likes = likes || Likes.new
  end
end

class PhotosController::Likes
  attr_reader :count

  def initialize(count = nil)
    @count = count || rand(10)
  end
end
