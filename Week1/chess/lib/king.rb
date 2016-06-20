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
		diff_x = new_location.x - @loc.x
		diff_y = new_location.y - @loc.y
		if( diff_x.abs <= 1 && diff_y.abs <= 1)
			super(new_location)
		else
			false
		end
	end


end
