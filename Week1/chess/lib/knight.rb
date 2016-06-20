
require_relative("piece.rb")

class Knight < Piece
	def initialize(location, color)
		super(location, color)
		if color == "white"
			@name = " wN "
		else
			@name = " bN "
		end 
		
	end
	
	def can_move?(new_location)
		diff_x = new_location.x - @loc.x
		diff_y = new_location.y - @loc.y
		if( (diff_x.abs == 1 && diff_y.abs == 2) || (diff_x.abs == 2 && diff_y.abs == 1) )
			true
		else
			false
		end
	end
end