#app.rb
require_relative("lib/rook.rb")
require_relative("lib/king.rb")
require_relative("lib/bishop.rb")
require_relative("lib/knight.rb")
require_relative("lib/queen.rb")
require_relative("lib/pawn.rb")
require_relative("lib/board.rb")
require_relative("lib/piece.rb")
require_relative("chess_test.rb")


white= "white"
black= "black"

myTest = Tests.new
myTest.do_chess_tests


white_rook1 = Rook.new(Location.new(0,0),white)
white_knight1 = Knight.new(Location.new(1,0), white)
white_bishop1 = Bishop.new(Location.new(2,0), white)
white_queen = Queen.new(Location.new(3,0), white)	
white_king = King.new(Location.new(4, 0), white)	
white_bishop2 = Bishop.new(Location.new(5,0), white)
white_knight2 = Knight.new(Location.new(6,0), white)
white_rook2 = Rook.new(Location.new(7,0),white)
white_pawn1 = Pawn.new(Location.new(0,1),white)
white_pawn2 = Pawn.new(Location.new(1,1), white)
white_pawn3 = Pawn.new(Location.new(2,1), white)	
white_pawn4 = Pawn.new(Location.new(3,1), white)
white_pawn5 = Pawn.new(Location.new(4,1), white)
white_pawn6 = Pawn.new(Location.new(5,1), white)
white_pawn7 = Pawn.new(Location.new(6,1), white)
white_pawn8 = Pawn.new(Location.new(7,1),white)

black_rook1 = Rook.new(Location.new(0,7),black)
black_knight1 = Knight.new(Location.new(1,7), black)
black_bishop1 = Bishop.new(Location.new(2,7), black)
black_queen = Queen.new(Location.new(3,7), black)
black_king = King.new(Location.new(4, 7), black)
black_bishop2 = Bishop.new(Location.new(5,7), black)
black_knight2 = Knight.new(Location.new(6,7), black)
black_rook2 = Rook.new(Location.new(7,7),black)

black_pawn1 = Pawn.new(Location.new(0,6), black)
black_pawn2 = Pawn.new(Location.new(1,6), black)
black_pawn3 = Pawn.new(Location.new(2,6), black)
black_pawn4 = Pawn.new(Location.new(3,6), black)
black_pawn5 = Pawn.new(Location.new(4,6), black)
black_pawn6 = Pawn.new(Location.new(5,6), black)
black_pawn7 = Pawn.new(Location.new(6,6), black)
black_pawn8 = Pawn.new(Location.new(7,6), black)

pieces = [
	white_rook1, white_knight1, white_bishop1, white_queen, white_king, white_bishop2,
	white_knight2, white_rook2, white_pawn1, white_pawn2, white_pawn3, white_pawn4, white_pawn5,
	white_pawn6, white_pawn7, white_pawn8, 
	black_rook1, black_knight1, black_bishop1, black_queen, black_king, black_bishop2,
	black_knight2, black_rook2, black_pawn1, black_pawn2, black_pawn3, black_pawn4, black_pawn5,
	black_pawn6, black_pawn7, black_pawn8
]


myGame = Board.new(pieces)


input = nil

puts "To play, please input piece to move and location in the form x,y to i,j . Have fun!"
while input != "quit"
	if myGame.whites_turn 
		puts "White's turn"
	else 
		puts "Black's turn"
	end
	input = gets.chomp()
	locations = input.split(" ")
	x1 = locations[0][0].to_i - 1
	y1 = locations[0][2].to_i - 1

	x2 = locations[2][0].to_i - 1
	y2 = locations[2][2].to_i - 1

	myGame.move_piece(Location.new(x1, y1), Location.new(x2, y2))

	#puts "#{x1} #{y1} #{x2} #{y2}"


end




