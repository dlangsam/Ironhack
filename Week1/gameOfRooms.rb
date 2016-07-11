require_relative ("room.rb")

class GameOfRooms
	attr_reader :first_room, :player_location

	def initialize
		@first_room = Room.new("castle", "It is haunted. The paintings stare at you.")
		@winning_room = Room.new("castle tower", "You saved the princess! Huzzah!")
		@player_location = @first_room
		@won = false
	end
	
	def add_door_to_rooms(room1, room2, direction)
		if direction == "N"
			room1.add_exit("N", room2)
			room2.add_exit("S",room1)
		elsif direction == "S"
			room1.add_exit("S", room2)
			room2.add_exit("N",room1)
		elsif direction == "E"
			room1.add_exit("E", room2)
			room2.add_exit("W",room1)
		else
			room1.add_exit("W", room2)
			room2.add_exit("E",room1)
		end
	end

	def add_winning_move(room1, direction)
		room1.add_exit("direction", @winning_room)
	end
	def print_location()
		puts "You are in #{@player_location.name}. #{@player_location.description}"
		puts "There are exits to the "
		exit_options = @player_location.exits
		exit_options.keys.each do |exit|
		print "#{exit}"
	end
	end
	def won?
		@won
	end
	def move_rooms(direction)
		if @player_location.exits[direction] != nil
			@player_location = @player_location.exits[direction]
			if @player_location == winning_room
				@won = true
			end
		end
	end
end

