class Car
	def initialize
		@wheels = 4
	end
	def make_sound
		puts "Vroom vroom"
	end
	def count_wheels
		@wheels
	end
end

class Ship
	def initialize
		@wheels = 0
	end
	def make_sound
		puts "Hoooonk hooonk"
	end
	def count_wheels
		@wheels
	end
end

class Bike
	def initialize
		@wheels = 2
	end
	def make_sound
		puts "Whoosh"
	end
	def count_wheels
		@wheels
	end
end