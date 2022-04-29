class UsersMoviesController < ApplicationController
  before_action :authorized, except: [:index, :show]

  def index
    if params[:search]
      @found_movies = MovieFacade.new.search(params[:search])
      render 'index'
    elsif params[:top_rated].nil?
      @top_rated = MovieFacade.new.best_movies
    elsif params[:top_rated]
      @top_rated = MovieFacade.new.best_movies
    end
  end

  def show
    @movie = MovieFacade.new.details(params[:id])
    @providers = MovieFacade.new.providers(params[:id])
    @cast = MovieFacade.new.cast(params[:id])
    @reviews = MovieFacade.new.reviews(params[:id])
  end
end