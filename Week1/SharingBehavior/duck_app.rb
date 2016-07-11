require_relative("lib/vehicles.rb")
require_relative("lib/vehicleArrays.rb")


vehicles = [Car.new, Car.new, Ship.new, Bike.new]

wheelCounter = WheelCounter.new(vehicles)
puts wheelCounter.count_total_wheels

noiseMaker = NoiseMaker.new(vehicles)
noiseMaker.make_noises