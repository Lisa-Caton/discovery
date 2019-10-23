require 'rails_helper'
require 'excon'

RSpec.describe WelcomeController, type: :controller do
  describe 'welcome#index' do
    render_views
    #this line tests the partials^

    it 'should route to the index' do
      get :index
      expect(response).to render_template("index")
    end

    context 'Individual partials are rendered on index template' do
      it "should render the header" do
        get :index
        expect(response).to render_template :index
        expect(response).to render_template(partial: '_header')
      end

      it "should render the heading" do
        get :index
        expect(response).to render_template :index
        expect(response).to render_template(partial: '_heading')
      end

      it "should render the movies" do
        get :index
        expect(response).to render_template :index
        expect(response).to render_template(partial: '_movies')
      end

      it "should render the tvshows" do
        get :index
        expect(response).to render_template :index
        expect(response).to render_template(partial: '_tvshows')
      end
      it "should render the actors" do
        get :index
        expect(response).to render_template :index
        expect(response).to render_template(partial: '_actors')
      end
    end

    #
    # context 'Trending elements' do
    #   it 'should render the title and images' do
    #     expect('<img src="http://image.tmdb.org/t/p/w154<%= @trending[0]["poster_path"] %>"/>').to eql?('http://image.tmdb.org/t/p/w154/lcq8dVxeeOqHvvgcte707K0KVx5.jpg')
    #   end
    # end
    #
    # context 'Movie elements' do
    #   it 'should render the title and images' do
    #   end
    # end
    #
    # context 'Tv Show elements' do
    #   it 'should render the title and images' do
    #   end
    # end

  end

  describe 'welcome#search' do
    it 'should route to the search' do
      get :search
      expect(response).to render_template(:search)
    end

    it 'should route to the search' do
      connection = Excon.new("https://api.themoviedb.org/3/search/multi?api_key=#{api_key}&language=en-US&query=#{query}", :mock => true)
      get :search
      Excon.stub({}, {:status => 200})
      expect(search_path).to eq "https://api.themoviedb.org/3/search/multi?api_key=#{api_key}&language=en-US&query=#{query}"
    end

  end
end
