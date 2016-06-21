require_relative("piece.rb")

class King < Piece
	def label
		"K"
	end

	def can_move?(new_location)
		diff = @loc.distance(new_location)

		if( diff[:x].abs <= 1 && diff[:y].abs <= 1)
			super(new_location)
		else
			false
		end
	end


end
