require_relative("piece.rb")

class King < Piece
	def initialize(location, color)
		super(location, color)
		if color == "white"
			@name = " wK "
		else
			@name = " bK "
		end
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
