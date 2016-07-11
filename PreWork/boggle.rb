class Dice
	attr_reader :topLetter
	def initialize(string_of_letters)
		if(letters?length != 6)
			puts "Dice can only have 6 sides"
		else
			@letters = string_of_letters.split()
		end
		topLetter = @letters[0]
	end
	def shake()
		i = Random.new.rand * 6
		topLetter = @letters[i]
	end
end

class Board
	def initialize(dice)
		@dice = dice
		@squares = [][]
	end
	def shakeDice()

	end
end