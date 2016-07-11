# app.rb

require_relative("lib/car.rb")
require_relative("lib/spaceship.rb")

first_spaceship = Spaceship.new

first_spaceship.fly

first_car = Car.new

first_car.drive

second_car = NoisyCar.new

second_car.drive

Car.speed_control

first_car.cities
