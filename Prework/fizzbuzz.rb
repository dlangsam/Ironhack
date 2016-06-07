=begin
for i in 1..100
	if i % 15  == 0
		puts "FizzBuzz"
	elsif i % 3 == 0
		puts "Fizz"
	elsif i % 5 == 0
		puts "Buzz"
	else 
		puts "#{i}"
	end
end
=end
=begin
i = 1
while i <= 100
	stringRep = "#{i}"
	result = ""
	if stringRep[0] == "1"
		result = "#{result}Bang"
	end
	if i % 3 == 0
		result = "#{result}Fizz"
	end
	if i % 5 == 0
		result = "#{result}Buzz"
	end
	if result.length == 0
		result = stringRep
	end
	puts result
	i += 1
end
=end 

i = 1
while i <= 100
	stringRep = "#{i}"
	result = ""
	if stringRep[0] == "1"
		result << "Bang"
	end
	if i % 3 == 0
		result << "Fizz"
	end
	if i % 5 == 0
		result << "Buzz"
	end
	if result.length == 0
		result = stringRep
	end
	puts result
	i += 1
end