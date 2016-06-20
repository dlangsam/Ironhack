require_relative("piece.rb")

class Bishop < Piece
	include DiagonalMover
	def initialize(location, color)
		super(location, color)
		if color == "white"
			@name = " wB "
		else
			@name = " bB "
		end 
		
	end
	
	def can_move?(new_location)
		diff_x = new_location.x - @loc.x
		diff_y = new_location.y - @loc.y
		if diagonal_move?(diff_x, diff_y)
			super(new_location)
		else
			false
		end
	end
end