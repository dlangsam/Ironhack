require_relative("../lib/movie_handler.rb")
require_relative("../lib/player.rb")


RSpec.describe 'Movie Handler tests' do
  let :movie_handler do 
    MovieHandler.new(Player.new)
  end
 it "checks search method fills nine_movies array with nine movies" do
    movie_handler.search("funny")
    expect(movie_handler.nine_movies.length).to eq(9)
  end
  # it "checks that the random_search method fills nine_movies with nine movies" do
 	#   movie_handler.random_search
  #   expect(movie_handler.nine_movies.length).to eq(9)
  # end
  it "checks that the get_rand_fact method returns a random fact with the category of fact, correct movie, and the fact" do
 	  movie_handler.search("funny")
    fact = movie_handler.get_rand_fact
    expect(fact.length).to eq(3)
  end
 
end