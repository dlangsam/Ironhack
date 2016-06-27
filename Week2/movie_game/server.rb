#server.rb

require 'sinatra'
require 'sinatra/reloader'
require 'imdb'
require_relative('lib/movie_handler.rb')

enable(:sessions)
player = Player.new
movie_handler = MovieHandler.new(player)


get "/" do 
	erb(:movie_search)
end

post "/search_word" do
	word = params[:word]
	movie_handler.search(word) 
	@nine_movies = movie_handler.nine_movies
	@type_of_question, @fact, @correct_movie = movie_handler.get_rand_fact
	session[:answer]  = @fact
	session[:question_type] = @type_of_question
	session[:correct_movie] = @correct_movie
	erb(:movie_posters)
end

post "/random_movies" do
	movie_handler.random_search
	@nine_movies = movie_handler.nine_movies
	@type_of_question, @fact, @correct_movie = movie_handler.get_rand_fact
	session[:answer]  = @fact
	session[:question_type] = @type_of_question
	session[:correct_movie] = @correct_movie
	erb(:movie_posters)
end

get "/movie_answer/?:index?" do
	index= params[:index]
	user_answer = movie_handler.nine_movies[index.to_i]
	@correct = movie_handler.is_movie_right(user_answer, session[:question_type], session[:answer])
	@correct_movie = session[:correct_movie]
	erb(:results)
end

post "/continue" do
	if params[:continue] == "yes"
		@nine_movies = movie_handler.nine_movies
		@type_of_question, @fact, @correct_movie = movie_handler.get_rand_fact
		session[:answer]  = @fact
		session[:question_type] = @type_of_question
		session[:correct_movie] = @correct_movie
		erb(:movie_posters)
	else

		
		@num_correct = player.score
		@questions = player.questions_answered
		erb(:final_score)
	end
end


get "/score" do
	"I'm not keepting track of your score"
end


