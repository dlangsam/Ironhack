require_relative("lib/room.rb")
require_relative("lib/gameOfRooms.rb")

first_room = Room.new("the parking lot", "It is a crowded parking lot, but a spot just opens up by the entrance.")
winning_room = Room.new("Nordstrom", "You found the perfect oufit!")
winning_room.add_object("gorgeous dress", {:cost => 120, :energy => 0})
winning_room.add_object("discount dress", {:cost => 35, :energy => 0})
winning_room.add_object("designer suit", {:cost => 140, :energy => 0})
winning_room.add_object("discount suit", {:cost => 40, :energy => 0})
room1 = Room.new("Macy's", "A lady is trying to sell you perfume.")
room1.add_object("sundress", {:cost => 30, :energy => 0})
room1.add_object("shoes", {:cost => 45, :energy => 0})
room1.add_object("perfume", {:cost => 60, :energy => 0})
room1.add_object("cologne", {:cost => 50, :energy => 0})
room2 = Room.new("Express", "Buy 2 shirts, get one half off.")
room2.add_object("blouse", {:cost => 25, :energy => 0})
room2.add_object("polo", {:cost => 20, :energy => 0})
room3 = Room.new("Gap", "The jeans are all disorganized.")
room3.add_object("skinny jeans", {:cost => 70, :energy => 0})
room3.add_object("bootcut jeans", {:cost => 50, :energy => 0})
room4 = Room.new("Johnny Rockets", "The burger and shakes smell delicious.")
room4.add_object("burger", {:cost => 5, :energy => 8})
room4.add_object("shake", {:cost => 3, :energy => 3})
room4.add_object("fries", {:cost => 4, :energy => 5})
room5 = Room.new("the bathroom", "Ew, it smells.")
room6 = Room.new("Ann Taylor", "How about some tasteful office outfits?")
room6.add_object("pencil skirt", {:cost => 45, :energy => 0})
room6.add_object("necklace", {:cost => 15, :energy => 0})
room7 = Room.new("H&M", "Everything is so cheap but the line for the dressing room is forever.")
room7.add_object("leggings", {:cost => 6, :energy => 0})
room7.add_object("hat", {:cost => 12, :energy => 0})
room7.add_object("tshirt", {:cost => 4, :energy => 0})
room7.add_object("mini skirt", {:cost => 10, :energy => 0})
room7.add_object("button up shirt", {:cost => 8, :energy => 0})
myGame = GameOfRooms.new("Mall", first_room, winning_room, 250, 10)


myGame.add_door_to_rooms(first_room, room1, "E")
myGame.add_door_to_rooms(room1, room2, "S")
myGame.add_door_to_rooms(room2, room3, "S")
myGame.add_door_to_rooms(room2, room4, "W")
myGame.add_door_to_rooms(room4, room5, "N")
myGame.add_door_to_rooms(room4, room6, "S")
myGame.add_door_to_rooms(room6, room7, "E")
myGame.add_door_to_rooms(room7, winning_room, "N" )


input = nil
myGame.printDescription
while input != "quit" && !myGame.won?
	myGame.print_location
	print "\n"
	print "Where would you like to go? Or you can maybe buy something?"
	print "\n>"
	input = gets.chomp
	if input.start_with? "buy"
		input_arr = input.split("buy ")
		command, *item = input_arr
		myGame.buy(*item)
	else
		myGame.move_rooms(input.upcase)
	end
	
end


if myGame.won?
	puts "Congrats you bought "
	myGame.bought_items.each do |purchase|
		print "#{purchase} "
	end
	puts "You have #{myGame.money} left"
else
	puts "You bought "
	myGame.bought_items.each do |purchase|
		print "#{purchase} "
	end	
	puts "But you ran out of money!"	

end


