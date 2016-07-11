class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

def print_homes(homes)
	homes.each do |place|
 	puts "#{place.name} in #{place.city}"
 	puts "Price: $#{place.price} Max. capacity: #{place.capacity}"
 end
end


homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Devorah's place", "Miami", 4, 55),
  Home.new("Dan's place", "Durango", 8, 65),
  Home.new("Jessica's place", "Montclair", 1, 38),
  Home.new("Blaire's place", "St. Louis", 4, 40),
  Home.new("Hannah's place", "St. Louis", 2, 35)


]

homes.sort_by!{|place| place.price}

print_homes(homes)

 puts "Would you like to sort by highest price? capacity?"
 response = gets.chomp

if(response == "highest price")
	homes.sort_by!{|place| -place.price}
	print_homes(homes)
elsif response == "capacity"
	homes.sort_by!{|place| place.capacity}
	print_homes(homes)
end


 puts "Would you like to filter by city"
 response = gets.chomp

 if(response == "no")
else
	filtered_homes = homes.select do |hm|
  # Keep hm only if its city is "San Juan"
  		hm.city == response
	end
	print_homes(filtered_homes)
end

avg_price = 0
total_price = homes.reduce(0.0) do |sum, home|
	sum += home.price
end
avg_price = total_price / homes.length
puts " The average price is: #{avg_price}"


 puts "Name your price?"
 response = gets.chomp

 if(response == "no")
else
	name_your_price_home = homes.find do |hm|
  # Keep hm only if its city is "San Juan"
  		hm.price <= response.to_i
	end
	if name_your_price_home != nil
		puts "#{name_your_price_home.name} price: #{name_your_price_home.price} "
	else
		puts "No places found"
	end
end





# homes.each do |place|
# 	puts "#{place.name} in #{place.city}"
# 	puts "Price: $#{place.price}"
# end

# cities = homes.map do |hm|
#   hm.city
# end

# puts cities

# prices = homes.map do |place|
# 	place.price
# end

# avg_price = 0
# total_price = prices.reduce(0.0) do |sum, price|
# 	sum += price
# end
# avg_price = total_price / prices.length
# puts avg_price


# total_capacities = homes.reduce(0.0) do |sum, hm|
#   sum + hm.capacity
# end

# puts "The average capacity is:"
# puts total_capacities / homes.length