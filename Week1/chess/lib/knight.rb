
require_relative("piece.rb")

class Knight < Piece
	def label
		"N"
	end

	def can_move?(new_location)
		diff = @loc.distance(new_location)

		if( (diff[:x].abs == 1 && diff[:y].abs == 2) || (diff[:x].abs == 2 && diff[:y].abs == 1) )
			true
		else
			false
		end
	end
end
