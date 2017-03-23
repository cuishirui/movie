class Movie < ApplicationRecord

  has_many :reviews
  belongs_to :user

  has_many :movie_favorites
  has_many :members, through: :movie_favorites, source: :user 
end
