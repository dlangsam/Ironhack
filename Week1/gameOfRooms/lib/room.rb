class Room
	attr_reader :name
	attr_reader :description
	attr_reader :exits, :objects
	def initialize(name, description)
		@name = name
		@description = description
		@objects = {}
		@exits = {}
	end
	def add_exit(direction, room)
		@exits[direction] = room
	end
	def add_object(object_name, hash)
		@objects[object_name] = hash
	end
	def pickup_object(object)
		@objects.delete(object)
	end



end


# class Room
# 	attr_reader :name
# 	def initialize(name, width, length)
# 		@name = name
# 		@width = width
# 		@length = length
# 		##create my room of array by arrays
# 		@room_spaces = []
# 		@doors = []
# 		for i in (0...width)
# 			room_spaces.push([])
# 			for j in (0...height)
# 				room_spaces.[i].push("")
# 			end
# 		end

# 		#add some random doors
# 		# @number_of_doors = Random.new.rand * 4

# 		# for i in (0..@number_of_doors)
# 		# 	x = Random.new.rand * @width
# 		# 	y = Random.new.rand * @length
# 		# 	while !self.space_filled(x,y)
# 		# 		@room_spaces[x][y] = {"door"}
# 		# 		@doors.push(:x => x, :y => y)
# 		# 	end
# 		# end

# 	end

# 	def add_door(another_room)
# 		x = 0
# 		y = 0
# 		do
# 			x = Random.new.rand * @width
# 	 		y = Random.new.rand * @length
# 	 	while (self.space_filled(x,y))
# 			@room_spaces[x][y] = {:door => another_room}
# 		end
# 	end
# 	def space_filled(x,y)
# 		 @room_spaces[x][y] != ""
# 	end
# end