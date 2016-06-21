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
		diff = @loc.distance(new_location)

		if diagonal_move?(diff[:x], diff[:y])
			super(new_location)
		else
			false
		end
	end
end
