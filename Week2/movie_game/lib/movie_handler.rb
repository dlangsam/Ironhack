require 'imdb'

require_relative('player.rb')
require_relative('dictionary.rb')

class MovieHandler
	attr_reader :nine_movies
	def initialize(player)
		@player = player
		@nine_movies = []
		@dictionary = Dictionary.new("/usr/share/dict/words")
	end
	def search(search_word)
		search_results=Imdb::Search.new(search_word)
		movie_results = search_results.movies
		# @nine_movies = [
		# 	Imdb::Movie.new( '1258197' ),
		# 	Imdb::Movie.new( '0292506' ),
		# 	Imdb::Movie.new( '2407380' ),
		# 	Imdb::Movie.new( '2788732' ),
		# 	Imdb::Movie.new( '2719848'),
		# 	Imdb::Movie.new( '1790809' ),
		# 	Imdb::Movie.new( '2823054'),
		# 	Imdb::Movie.new( '1124037' ),
		# 	Imdb::Movie.new( '2025690' )
		# ]
		@nine_movies = []
		i = 0
		while @nine_movies.length < 9

			movie = movie_results[i]
			if movie.poster != nil && !movie.title.include?("TV") && !movie.title.include?("Video Game")
				@nine_movies.push(movie)
			end
			if(@nine_movies.length == 9)
				break 
			end	
			i += 1

		end	

		#puts "\n---------------HELLO-------------------"
		#p @nine_movies.length
		#puts ""

	end
	def random_search
		i = 0
		@nine_movies = []
		while @nine_movies.length < 9
			search_word = @dictionary.get_short_word(9)
			search_results=Imdb::Search.new(search_word)
			movie_results = search_results.movies

			i = 0
			movie_found = false
			movie_results.each do |movie|
				
				if movie.poster != nil && !movie.title.include?("TV") && !movie.title.include?("Video Game")
					@nine_movies.push(movie)
					break
				end
			end	

		end
	end
	
	def poster_urls
		urls = 
		@nine_movies.map do |movie|
			movie.poster
		end
	end
	
	def years
		years = 
		@nine_movies.map do |movie|
			movie.year
		end
	end

	def actors
		actors = 
		@nine_movies.map do |movie|
			movie.cast_members[0]
		end
	end

	def taglines
		taglines = 
		@nine_movies.map do |movie|
			movie.tagline
		end
	end

	def get_rand_fact
		answer = nil
		question = nil
		movie = nil
		while(answer == nil)
			rand_num = Random.new.rand * 9
			num = Random.new.rand * 3
			puts rand_num
			puts num
			if num.floor == 0
				question = "years"
				movie = @nine_movies[rand_num.floor]
				answer = movie.year
			elsif num.floor == 1
				question = "actors"
				movie = @nine_movies[rand_num.floor]
				answer = movie.cast_members[0]
			elsif num.floor == 2
				question = "taglines"
				movie = @nine_movies[rand_num.floor]
				answer = movie.tagline
			end
			puts answer
		end
		[question, answer, movie.title]
	
	end

	def is_movie_right(movie, key, answer)
		if key == "years"
			if movie.year == answer
				@player.answered_right
				return true
			end

		elsif key == "actors"
			if movie.cast_members[0] == answer
				@player.answered_right
				return true
			end
		elsif key == "taglines"
			if movie.tagline == answer
				@player.answered_right
				return true
			end
		end
		
		@player.answered_wrong
		false
	
	end
end