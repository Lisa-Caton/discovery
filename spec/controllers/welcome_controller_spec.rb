require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'welcome#index' do

    context 'The http request is a success' do
      it 'should route to the index' do
        get :index
      end
    end

    context 'Trending elements' do
      it 'should render the title and images' do
        expect('<img src="http://image.tmdb.org/t/p/w154<%= @trending[0]["poster_path"] %>"/>').to eql?('http://image.tmdb.org/t/p/w154/lcq8dVxeeOqHvvgcte707K0KVx5.jpg')
      end
    end

    context 'Movie elements' do
      it 'should render the title and images' do
      end
    end

    context 'Tv Show elements' do
      it 'should render the title and images' do
      end
    end

  end
end
