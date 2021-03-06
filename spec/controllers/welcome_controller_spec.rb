require 'rails_helper'
require 'excon'

RSpec.describe WelcomeController, type: :controller do
  describe 'welcome#index' do
    render_views #this line tests the partials^

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
        expect(response).to render_template(partial: '_heading_hero')
      end

      it "should render the movies" do
        get :index
        expect(response).to render_template :index
        expect(response).to render_template(partial: '_movies_popular')
      end

      it "should render the tvshows" do
        get :index
        expect(response).to render_template :index
        expect(response).to render_template(partial: '_trending_people')
      end
      it "should render the actors" do
        get :index
        expect(response).to render_template :index
        expect(response).to render_template(partial: '_tvshows_airing')
      end
      it "should render the actors" do
        get :index
        expect(response).to render_template :index
        expect(response).to render_template(partial: '_tvshows_popular')
      end
    end
  end
end
