class Lexiconomitron
	def eat_t(string)

		string.downcase.gsub("t", "")
	end

	def first_and_last(array_of_strings)
		new_array = []
		new_array.push(array_of_strings[0])
		new_array.push(array_of_strings[array_of_strings.length - 1])
		new_array
	end

	def reverse_words(strings)
		strings.each do |s|
			s.reverse!
		end

	end

	def shazam(array_of_strings)
		array_of_strings = reverse_words(array_of_strings)
		array_of_strings = first_and_last(array_of_strings)
		no_t_array = array_of_strings.map do |word|
			eat_t(word)
		end
	end

	def oompa_loompa(array_of_strings)
		
		short_words = array_of_strings.select do |word|
  			word.length <= 4
		end
		no_t_array = short_words.map do |word|
			eat_t(word)
		end
		
		
	end

end