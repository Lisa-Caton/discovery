require 'rubygems'
require 'excon'
require 'json'

class WelcomeController < ApplicationController
  def index
    response = Excon.get("https://api.themoviedb.org/3/movie/popular?api_key=#{api_key}&language=en-US")
    @popular_movies = JSON.parse(response.body)['results']

    response = Excon.get("https://api.themoviedb.org/3/tv/top_rated?api_key=#{api_key}")
    @TR_tv_shows = JSON.parse(response.body)['results']

    response = Excon.get("https://api.themoviedb.org/3/trending/person/day?api_key=#{api_key}")
    @trending_actor = JSON.parse(response.body)['results']
  end

  def search
      @query = params[:search_this_item].downcase
      response = Excon.get("https://api.themoviedb.org/3/search/multi?api_key=#{api_key}&language=en-US&query=#{@query}")
      @search_data = JSON.parse(response.body)
  end


  private
  def api_key
    ENV['the_moviedb_api_key']
  end


end
