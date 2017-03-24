class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def new
    @movie = Movie.find(params[:movie_id])
    if current_user.is_member_of?(@movie)
      @review = Review.new
    else
      redirect_to :back
      flash[:warning] = "please join this movie"
    end
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.new(review_params)
    @review.movie = @movie
    @review.user = current_user
    if @review.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:comment)
  end
end
