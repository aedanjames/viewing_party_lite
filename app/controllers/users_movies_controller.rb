class UsersMoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    if params[:top_rated] == "top_rated"
      # @top_rated = TopRated.new.movies
      @top_rated = MovieFacade.new.movies
      render 'index'
    elsif params[:search]
      # @found_movies = MovieSearch.new.search(params[:search])
      @found_movies = MovieFacade.new.search(params[:search])
      render 'index'
    end
  end

  def show
  end
end
