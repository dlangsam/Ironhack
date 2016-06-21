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
		diff = @loc.distance(new_location)

		if diagonal_move?(diff[:x], diff[:y]) ||
			straight_move?(diff[:x], diff[:y])
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
