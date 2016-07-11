require_relative("vehicles.rb")

class WheelCounter
	attr_reader :vehicles
	def initialize(vehicles)
		@vehicles = vehicles
	end
	def count_total_wheels

		number_wheels = vehicles.reduce(0) do |sum, vehicle|
			sum += vehicle.count_wheels 
		end
		number_wheels
	end
end

class NoiseMaker
	attr_reader :vehicles
	def initialize(vehicles)
		@vehicles = vehicles
	end
	def make_noises

		vehicles.each do |vehicle|
			vehicle.make_sound
		end
	end
end