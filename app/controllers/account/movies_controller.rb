class Account::MoviesController < ApplicationController

  def index
    @movies = current_user.love_movies.all 
  end
end
