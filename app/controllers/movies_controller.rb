require 'pry-byebug'
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movies = PgSearch.multisearch(params[:query]) if params[:query].present?
    # binding.pry
  end
end
