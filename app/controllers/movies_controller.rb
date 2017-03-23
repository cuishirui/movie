class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    if @movie.save
      current_user.join!(@movie)
      redirect_to movies_path
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = Review.all
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  def join
    @movie = Movie.find(params[:id])

    if !current_user.is_member_of?(@movie)
      current_user.join!(@movie)
      flash[:notice] = "加入收藏"
    else
      flash[:notice] = "无法加入收藏"
    end
    redirect_to movie_path(@movie)
  end

  def quit
    @movie = Movie.find(params[:id])
    if current_user.is_member_of?(@movie)
      current_user.quit!(@movie)
      flash[:warning] = "取消收藏"
    else
      flash[:warning] = "无法取消收藏"
    end
    redirect_to movie_path(@movie)
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :picture, :description)
  end
end
