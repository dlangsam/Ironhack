#piece.rb
class Piece
	@@white = "white"
	@@black = "black"
	attr_reader :loc, :name, :color, :alive

	def initialize(location, color)
		@loc = location
		@color = color
		@alive = true

		if color == "white"
			@name = " w#{label} "
		else
			@name = " b#{label} "
		end
	end

	def killed
		@alive = false
	end
	def print_loc
		puts "Piece at #{@loc.x} , #{@loc.y}."
	end
	def move(new_location)
		if can_move?(new_location)
			@loc = new_location
		end
	end
	def can_move?(new_location)
		if !@alive
			puts "Piece not in play"
		end
		#check that it is a new location
		#not moving is always not valid
		new_location.x != @loc.x || new_location.y != @loc.y

	end
end


module DiagonalMover
	def diagonal_move?(change_x, change_y)
		change_x.abs == change_y.abs
	end
end

module StraightMover
	def straight_move?(change_x, change_y)
		change_x == 0 || change_y == 0
	end
end

