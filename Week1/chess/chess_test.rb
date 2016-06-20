require_relative("lib/rook.rb")
require_relative("lib/king.rb")
require_relative("lib/bishop.rb")
require_relative("lib/knight.rb")
require_relative("lib/queen.rb")
require_relative("lib/pawn.rb")
require_relative("lib/board.rb")
require_relative("lib/piece.rb")


class Tests
	def do_chess_tests
white= "white"
black= "black"
		#establish rooks in position
white_rook1 = Rook.new(Location.new(0,0),white)
white_king = King.new(Location.new(4, 0), white)
white_bishop1 = Bishop.new(Location.new(2,0), white)
white_knight1 = Knight.new(Location.new(1,0), white)
white_queen = Queen.new(Location.new(3,0), white)
white_pawn3 = Pawn.new(Location.new(2,1), white)
black_pawn5 = Pawn.new(Location.new(4,6), black)
puts "Rook tests"

puts white_rook1.can_move?(Location.new(0,5))
puts white_rook1.can_move?(Location.new(5,0))
puts !white_rook1.can_move?(Location.new(1,1))


puts "King tests"

puts  white_king.can_move?(Location.new(3,1)) 
puts  white_king.can_move?(Location.new(4,1)) 
puts  white_king.can_move?(Location.new(5,1)) 
puts  white_king.can_move?(Location.new(5,0)) 
#puts !white_king.can_move?(Location.new(4,0)) 

puts "Bishop tests"
puts  white_bishop1.can_move?(Location.new(3,1)) 
puts  !white_bishop1.can_move?(Location.new(2,1))
puts  white_bishop1.can_move?(Location.new(1,1))  
puts  white_bishop1.can_move?(Location.new(0,2))  
puts !white_bishop1.can_move?(Location.new(2,4))

puts "Knight tests"

puts  white_knight1.can_move?(Location.new(2,2)) 
puts  !white_knight1.can_move?(Location.new(2,1))
puts  white_knight1.can_move?(Location.new(0,2))  
puts  white_knight1.can_move?(Location.new(3,1))  
puts !white_knight1.can_move?(Location.new(2,4))

puts "Queen tests"

puts  white_queen.can_move?(Location.new(3,4)) 
puts  !white_queen.can_move?(Location.new(2,2))
puts  white_queen.can_move?(Location.new(0,3))  
puts  white_queen.can_move?(Location.new(5,2))  
puts !white_queen.can_move?(Location.new(4,2))

puts "Pawn tests"

puts  white_pawn3.can_move?(Location.new(2,2))
puts  white_pawn3.can_move?(Location.new(2,3))  
puts  !white_pawn3.can_move?(Location.new(3,1))
puts  black_pawn5.can_move?(Location.new(4,5))
puts  black_pawn5.can_move?(Location.new(4,4))    
puts !black_pawn5.can_move?(Location.new(5,4))
	end

end