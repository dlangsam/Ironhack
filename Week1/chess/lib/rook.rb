require_relative("piece.rb")

class Rook < Piece
	include StraightMover

	def label
		"R"
	end

	def can_move?(new_location)
		diff = @loc.distance(new_location)

		if straight_move?(diff[:x], diff[:y])
			super(new_location)
		else
			false
		end
	end
end

#is not moving a valid move????
