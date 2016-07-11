class Car
	def initialize
	@city_file = "city_list.txt"
	@noise = "Vroooom"
	end
	def self.speed_control
		puts "What is the current speed"
		speed = gets.chomp.to_i
		if(speed >= 100)
			puts "Slow down!"
		end
	end
	def drive
		puts @noise
	end
	def cities
		puts @city_file
		city_list =  IO.readlines(@city_file)
		city_list.each do |city|
			puts city
		end
	end
end

class NoisyCar < Car
	def drive
		puts "VROOOOOM"
	end
end

class RaceCar < Car
	def initialize
		@noise = "BROOM"
	end
end
