class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :reviews
  belongs_to :user

  has_many :movie_favorites
  has_many :members, through: :movie_favorites, source: :user

  validates :title, :image, :actor, :director,  presence: true
end
