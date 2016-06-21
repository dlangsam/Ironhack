require_relative("piece.rb")

class Queen < Piece
	include StraightMover
	include DiagonalMover

	def label
		"Q"
	end

	def can_move?(new_location)
		diff = @loc.distance(new_location)

		if diagonal_move?(diff[:x], diff[:y]) ||
			straight_move?(diff[:x], diff[:y])
			super(new_location)
		end
	end
end
