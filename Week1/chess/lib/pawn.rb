require_relative("piece.rb")

class Pawn < Piece
	def initialize(location, color)

		@moved_once = false
		@allowed_enemy_taking_move = []

		super(location, color)
	end

	def label
		"P"
	end

	def enemy_nearby(location)
		puts "adding a new allowed move #{location}"
		@allowed_enemy_taking_move.push(location)

	end
	def move(location)
		super(location)
		@allowed_enemy_taking_move.clear
		#find out if there are any more enemy taking moves

		@moved_once = true

	end
	def can_move?(new_location)
		diff = @loc.distance(new_location)

		if @allowed_enemy_taking_move.length > 0
			puts "testing special moves"
			@allowed_enemy_taking_move.each do |move|
				puts "special allowed move: #{move}"
				if new_location == move
					true
				end
			end
		elsif(diff[:x] != 0)
			puts "x should not change for pawns"
			false
		elsif( @color == @@white )
			if !@moved_once && diff[:y] <= 2
				super(new_location)
			elsif diff[:y] == 1
				true
			end
		elsif( @color == @@black )
			if !@moved_once && diff[:y] <= -2
				super(new_location)
			elsif diff[:y] == -1
				true
			end
			#super(new_location)
		else
			puts "all other pawn tests failed"
			false
		end
	end
end
