#lib/string_calculator.rb


class StringCalculator
	def add(numbers_string)
	
		num_array = numbers_string.split(/[^-0-9.]/)#split(/[^-]&\D/)
		num_array.reduce(0) do |partial_sum, num_string|
			partial_sum += num_string.to_i
		end
	end
end