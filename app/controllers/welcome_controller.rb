require 'rubygems'
require 'excon'
require 'json'
#rubygems allows flash alert to work properly!

class WelcomeController < ApplicationController
  add_flash_types :success, :warning, :danger, :info


  def index
    # Get Airing Today: TV Show
    response = Excon.get("https://api.themoviedb.org/3/tv/airing_today?api_key=#{api_key}&language=en-US&page=1")
    @tv_show_air_today = JSON.parse(response.body)['results']

    # Trending People
    response = Excon.get("https://api.themoviedb.org/3/trending/person/week?api_key=#{api_key}")
    @trending_people = JSON.parse(response.body)['results']

    # TV Show | Popular
    response = Excon.get("https://api.themoviedb.org/3/discover/tv?api_key=#{api_key}&language=en-US&sort_by=popularity.desc&page=1&timezone=America%2FNew_York&include_null_first_air_dates=false")
    @tv_show_popular = JSON.parse(response.body)['results']

    # Movies | Popular
    response = Excon.get("https://api.themoviedb.org/3/movie/popular?api_key=#{api_key}&language=en-US")
    @popular_movies = JSON.parse(response.body)['results']

  end

  def search
    # Everything (Multi) | Search
    param_policy
    @query = params[:search_this_item]
    response = Excon.get("https://api.themoviedb.org/3/search/multi?api_key=#{api_key}&language=en-US&query=#{@query}")
    @search_data = JSON.parse(response.body)['results']
  end


  private
  def api_key
    ENV['the_moviedb_api_key']
  end

  def param_policy
    special = "?<>',?[]}{=-)(!@*&^%$#`~{}"
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    if params[:search_this_item] =~ regex
      flash[:notice] = "Please try again, and remove special character(s):"
    end
    # expression = /^[a-zA-Z0-9\S]*$/
    # if @query =~ !expression
    #   flash[:notice] = "Please try again, and remove special characters."
    # end
  end

  def titleize
    split(/(\W)/).map(&:capitalize).join
  end


end
