class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    if params[:query].present?
      @movies = PgSearch.multisearch(params[:query])
      respond_to do |format|
        format.html # Follow regular flow of Rails
        format.text { render partial: 'movies_and_tv_shows.html', locals: { movies: @movies } }
      end
    else
      @movies = Movie.all
      respond_to do |format|
        format.html # Follow regular flow of Rails
        format.text { render partial: 'movie.html', locals: { movies: @movies } }
      end
    end
  end
end
