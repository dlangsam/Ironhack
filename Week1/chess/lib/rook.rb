require_relative("piece.rb")

class Rook < Piece
	include StraightMover
	def initialize(location, color)
		super(location, color)
		if color == "white"
			@name = " wR "
		else
			@name = " bR "
		end 
		
	end
	
	def can_move?(new_location)
		diff_x = new_location.x - @loc.x
		diff_y = new_location.y - @loc.y
		if straight_move?(diff_x, diff_y)
			super(new_location)
		else
			false
		end
	end
end

#is not moving a valid move????