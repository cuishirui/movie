class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews
  has_many :movies

  has_many :movie_favorites
  has_many :love_movies, through: :movie_favorites, source: :movie

  def is_member_of?(movie)
    love_movies.include?(movie)
  end

  def join!(movie)
    love_movies << movie
  end

  def quit!(movie)
    love_movies.delete(movie)
  end

  def admin?
    is_admin
  end
end
