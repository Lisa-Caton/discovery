require 'rubygems'
require 'excon'

class WelcomeController < ApplicationController
  def index

    # response = Excon.get("https://api.themoviedb.org/3/search/multi?api_key=#{api_key}&language=en-US&query=")
    # @search_bar = JSON.parse(response.body)


    response = Excon.get("https://api.themoviedb.org/3/trending/person/day?api_key=#{api_key}")
    @trending_actor = JSON.parse(response.body)['results']

    response = Excon.get("https://api.themoviedb.org/3/trending/person/day?api_key=#{api_key}")
    @trending_actor = JSON.parse(response.body)['results']

    response = Excon.get("https://api.themoviedb.org/3/movie/popular?api_key=#{api_key}&language=en-US")
    @popular_movies = JSON.parse(response.body)['results']

    response = Excon.get("https://api.themoviedb.org/3/tv/top_rated?api_key=#{api_key}")
    @TR_tv_shows = JSON.parse(response.body)['results']
  end


  private
  def api_key
    ENV['the_moviedb_api_key']
  end

end
