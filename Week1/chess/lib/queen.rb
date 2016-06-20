require_relative("piece.rb")

class Queen < Piece
	include StraightMover
	include DiagonalMover
	def initialize(location, color)
		super(location, color)
			if color == "white"
			@name = " wQ "
		else
			@name = " bQ "
		end 
	end
	
	def can_move?(new_location)
		diff_x = new_location.x - @loc.x
		diff_y = new_location.y - @loc.y
		if diagonal_move?(diff_x, diff_y) ||
			straight_move?(diff_x, diff_y)
			super(new_location)
		end
		# if(new_location.x == @loc.x  || new_location.y == @loc.y)
		# 	super(new_location)
		# elsif( diff_x.abs == diff_y.abs )
		# 	super(new_location)
		# else
		# 	false
		# end
	end
end