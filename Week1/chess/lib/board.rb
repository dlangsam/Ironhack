#board.rb

require_relative("rook.rb")
require_relative("king.rb")
require_relative("bishop.rb")
require_relative("knight.rb")
require_relative("queen.rb")
require_relative("pawn.rb")


class Board
	attr_reader :whites_turn
	@@white= "white"
	@@black= "black"
	def initialize(pieces)

		@whites_turn = true
		@layout = []
		@pieces = pieces
		for i in 0...8

			columns = []
			@layout.push(columns)
			for j in 0...8
				columns.push(" __ ")
			end
		end
		setup_pieces
	end
	def setup_pieces



		@pieces.each do |piece|
			piece_location = piece.loc
			#puts "#{piece.name}  #{piece_location.x} #{piece_location.y}"
			@layout[piece_location.y][piece_location.x] = piece
		end
		print_board
	end

	def pawn_check(location, moved_piece)
		puts "calling pawn_check"
		if @whites_turn
			puts "white's turn"
			#a white piece just moved, check if there is a black pawn at it's diagonal
			piece1 = @layout[location.y + 1][location.x + 1]
			piece2 =  @layout[location.y + 1][location.x - 1]
				puts piece1
			puts piece2
			if  piece1.class == Pawn  && piece1.color == @@black
				piece1.enemy_nearby(location)
				if moved_piece.class == Pawn
					moved_piece.enemy_nearby(piece1.loc)
				end

			end
			if piece2.class == Pawn  && piece2.color == @@black
				piece2.enemy_nearby(location)
				if moved_piece.class == Pawn
					moved_piece.enemy_nearby(piece2.loc)
				end
			end
		else
			puts "black's turn"
			piece1 = @layout[location.y - 1][location.x + 1]
			piece2 =  @layout[location.y - 1][location.x - 1]
			puts piece1
			puts piece2
			if  piece1.class == Pawn  && piece1.color == @@white
				piece1.enemy_nearby(location)
				if moved_piece.class == Pawn
					moved_piece.enemy_nearby(piece1.loc)
				end
			end
			if piece2.class == Pawn  && piece2.color == @@white
				piece2.enemy_nearby(location)
				if moved_piece.class == Pawn
					moved_piece.enemy_nearby(piece2.loc)
				end
			end
		end
	end

	def move_piece(orig_location, location)
		piece = @layout[orig_location.y][orig_location.x]
		if piece.is_a? String
			puts "No piece at this location"
			false
		elsif (piece.color == "white") != @whites_turn
			puts "You can't move your opponent's piece"
			false
		elsif location.x < 0 || location.x > 7 || location.y < 0 && location.y > 7
			puts "Invalid spot on board"
			false
		elsif !piece.can_move?(location)
			puts "Illegal move for #{piece.name}"
			false
		elsif !@layout[location.y][location.x].is_a? String
			other_piece = @layout[location.y][location.x]
			if other_piece.color == piece.color
				puts "Spot already occupied by your own piece"
				false
			else
				other_piece.killed

				change_piece_position(location, piece)
				pawn_check(location, piece)
				print_board
				@whites_turn = !@whites_turn
				true
			end
		else
			change_piece_position(piece, location)

			pawn_check(location, piece)
			print_board
			@whites_turn = !@whites_turn
			true
		end

	end

	def print_board
		@layout.reverse.each do |row|
			row.each do |space|
				if space.is_a? String
					print space
				else
					print space.name
				end
			end
			puts ""
		end
	end

	def change_piece_position(piece, new_location)
		@layout[new_location.y][new_location.x] = piece
		@layout[piece.loc.y][piece.loc.x] = " __ "
		piece.move(new_location)
	end

end
