# classmates = ["Daniel", "Christie", "Min"]

# classmates.each do |classmate|
# 	puts "Good morning #{classmate}"
# end


# foods = ["pizza", "french fries", "mac n cheese", "donuts", "black truffles"]

# lengths = foods.map do |dish|
# 	dish.length
# end



# p foods

cities = ["st. louis", "miami", "new york city"]

cap_cities = cities.map do |city|
	city_words = city.split(" ") 
	city_name = ""
	city_words.each do |word|
		city_name += "#{word.capitalize} "
	end
	city_name.strip!
end
p cap_cities