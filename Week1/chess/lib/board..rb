#board.rb

require_relative("lib/rook.rb")
require_relative("lib/king.rb")
require_relative("lib/bishop.rb")
require_relative("lib/knight.rb")
require_relative("lib/queen.rb")
require_relative("lib/pawn.rb")


class Board
	def initialize
		@spaces = []
		for i in 0...8
			@columns = []
			for j in 0...8
				columns.push(" __ ")
			end
		end
	end

	def print_board
		print @spaces
	end

end