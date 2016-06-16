require_relative ("room.rb")

class GameOfRooms
	attr_reader :first_room, :player_location, :bought_items, :money

	def initialize(name, first_room, winning_room, coins, strength)
		@name = name
		@first_room = first_room
		@winning_room = winning_room
		@player_location = @first_room
		@money = coins
		@won = false
		@bought_items = []
		@strength = strength
	end
	def printDescription
		puts "Welcome to the #{@name}. You have #{@money} to spend. Make sure you have enough to buy something when you get to the end."
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


	def print_location()
		puts ""
		puts "You are in #{@player_location.name}. #{@player_location.description}"
		if !@won
			for_sale = @player_location.objects
			if !for_sale.empty?
			puts "The following items are for sale:"
			for_sale.keys.each do |item|
				puts "#{item} for #{for_sale[item][:cost]} "
			end
			end
			puts "There are doors to the: "
			exit_options = @player_location.exits
			exit_options.keys.each do |exit|
				print "#{exit} "
			end
		end
	end
	def won?
		@won
	end
	def move_rooms(direction)
		if @player_location.exits[direction] != nil
			@player_location = @player_location.exits[direction]
			if @strength > 0
				@strength -= 1
			end
		end
	end

	def buy(item)
		if @player_location.objects[item] == nil
			puts "This item is not available"
		else
			energy = @player_location.objects[item][:energy]
			if @strength <= 0 && energy == 0
				puts "You are too hungry to shop"
			else
				cost = @player_location.objects[item][:cost]
				if @money < cost
					puts "You cannot afford #{item}"
				else
					puts "Thank you for shopping at #{@player_location.name}."
					@strength +=energy
					@money = @money - cost
					@player_location.pickup_object(item)
					@bought_items.push(item)
					if @player_location == @winning_room 
						@won = true
					end
				end
			end
		end
	end
end

