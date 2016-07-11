 r = 10..6
  10..6

(r.first).downto(r.last).each { |i| puts i }



hash = {
	:wat => ["batman", "superman", 
		{
			:wut =>
			[[1, 2, 3], [["a", "b", "c", "d", "e", "f", "g", "h", "i", {
					:bbq => "baby back ribs",
					:inidan => "chicken tikka"
				}]]]
		}
	]
}


#puts hash[:wat][2][:wut][1][0][9][:bbq]

arr = [["cats", "bunnies", "dogs", "hippos", "ducks", {
		:secret => {
			:unlock => ["donkey", "brand new car"]
		}
	}]

]

#puts arr[0][5][:secret][:unlock][1]

class Car
	attr_reader :make, :model
	def initialize(make, model)
		@make = make
		@model = model
	end

end

class CarDealer
	attr_reader :cars
	def initialize
		@cars = {}
	end
	def add_new_car(car)
		make = car.make
		if !@cars.has_key?(make)
			@cars[make] = []
		end
		@cars[make].push(car.model)
	end

end

carStore = CarDealer.new
elantra = Car.new("Hyundai", "Elantra")
sonata  = Car.new("Hyundai", "Sonata")
miata = Car.new("Mazda", "Miata")
bmw335 = Car.new("BMW", "335x")
bmw328 = Car.new("BMW", "328i")
prius = Car.new("Toyota", "Prius")



carStore.add_new_car(elantra)
carStore.add_new_car(sonata)
carStore.add_new_car(miata)
carStore.add_new_car(bmw335)
carStore.add_new_car(bmw328)
carStore.add_new_car(prius)



puts carStore.cars 


car_makes = carStore.cars.keys
car_makes.each do |make|
	carStore.cars[make].each do |car|
		puts car
	end
end
#carStore.add_new_car(sonata)