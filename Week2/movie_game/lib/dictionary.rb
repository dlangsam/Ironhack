class Dictionary
	def initialize(dictionary)
		@contents = IO.readlines(dictionary)
		
	end
	def get_word
		word = nil
		numWords = @contents.length
		while word == nil do
		
			randNumber = Random.new.rand 
			index = numWords * randNumber
	
			word = @contents[index].chomp
		end
		return word
	end

	def get_short_word(max_length)
		hasWord = false
		numWords = @contents.length
		while !hasWord do
		
			randNumber = Random.new.rand 
			index = numWords * randNumber
	
			word = @contents[index].chomp

			if(word.length >= 3 || word.length <= max_length )
				hasWord = true
				return word
			end
		end
	end


end