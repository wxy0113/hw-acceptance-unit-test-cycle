require 'rails_helper'
require 'movies_controller.rb'
require 'movie.rb'

#   And  I fill in "Title" with "Alita: Battle Angel"
#   And  I fill in "Director" with "Robert Rodriguez"
#   And  I select "PG-13" from "Rating"
#   And  I select "2019" from "movie_release_date_1i"
#   And  I select "February" from "movie_release_date_2i"
#   And  I select "14" from "movie_release_date_3i"

RSpec.describe MoviesController, type: :controller do
    describe 'create' do
        it 'Create @movie' do
            post :create, movie: {
                        title: "Alita: Battle Angel", 
                        rating: "PG-13", 
                        director: "Robert Rodriguez", 
                        release_date: "2019-02-14" }
            mov = Movie.find_by_title("Alita: Battle Angel")
            expect(assigns(:movie)).to eq(mov)
        end
    end
    describe 'update' do
        it 'Update @movie' do
            Movie.create!(:title => "Alita: Battle Angel", :rating => "PG-13", :director => "Robert Rodriguez", :release_date => "2019-02-14")
            mov = Movie.find_by_title("Alita: Battle Angel")
            patch :update, {:id => mov, movie: {
                title: "Alita: Battle Angel", 
                rating: "PG-13", 
                director: "Robert Rodriguez", 
                release_date: "2019-02-14" }}
            mov = Movie.find_by_title("Alita: Battle Angel")
            expect(assigns(:movie)).to eq(mov)
            expect(mov.title).to eq("Alita: Battle Angel")
            expect(mov.director).to eq("Robert Rodriguez")
        end
    end
    describe 'destroy' do
        it 'Delete @movie' do
            Movie.create!(:title => "Alita: Battle Angel", :rating => "PG-13", :director => "Robert Rodriguez", :release_date => "2019-02-14")
            mov = Movie.find_by_title("Alita: Battle Angel")
            delete :destroy, {:id => mov}
            mov = Movie.find_by_title("Alita: Battle Angel")
            expect(mov).to eq(nil)
        end
    end
end