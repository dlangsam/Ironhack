

class Player
	attr_reader :name 
	def initialize(playerNum, playerName = nil)
		puts "created a player"
		if(playerName === nil)
			puts ("What is your name?")
  			@name= gets.chomp
  		else
  			@name = playerName
  		end
  		@playerNumber = playerNum
  		puts ("Hello #{@name}. You are player #{@playerNumber}.")
	end
	def pickWord()
		if @playerNumber == 1
			puts("Pick the hangman word.")
			word = gets.chomp
		end
	end
	def guessLetter()
		if @playerNumber == 2
			begin 
				puts("Pick a letter to guess")
				letter = gets.chomp
				if(letter == "save")
					return "save"
				end
			end while letter.length != 1
			return letter
		end
	end
end

class AIPlayer < Player

	def initialize(dictionary)
  		@name= "Hangman Robot"
  		@playerNumber = 1
  		@hangman_dictionary = Dictionary.new(dictionary)
  		#puts ("Hello #{@name}. You are player #{@playerNumber}.")
	end
	def pickWord()
		word = @hangman_dictionary.getWord();	
	end
end


class Game
	def initialize()
		@allowedGuesses = 6
		puts("How may players do you have?")
		numPlayers = gets.chomp
		puts("Instructions: Try to guess the word letter by letter. 
			You have #{@allowedGuesses} wrong guesses before your man is hanged.")
		if(numPlayers === "2")
			@player1 = Player.new(1) 
			@player2 = Player.new(2)
		else
			@player1 = AIPlayer.new("princeton-dict-words.txt") 
			@player2 = Player.new(2)
		end
		@wrongGuesses = 0
		@word = ""
		@guessedWord = []
		@keepPlaying = true
	

	end
	def createGuessedWordArray(word)
		for i in 0...word.length
			@guessedWord.push("_")
		end
		puts ("The word is #{@guessedWord}")
	end
	
	def guessLetter(letter)
	
		if @word.include? letter
			i = 0
			while i != nil do
				i = @word.index(letter, i)
				if (i != nil)
					@guessedWord[i] = letter
					i += 1
				end
				
			end 
			puts ("#{@guessedWord}")
		
		else
			@wrongGuesses += 1
			guessesLeft = @allowedGuesses - @wrongGuesses
			puts ("#{letter} is not in the word. You have #{guessesLeft} guesses left.")
		end
	end
 
	def beginGuesses()
		begin
			guessLetter( @player2.guessLetter())
			if !(@guessedWord.include?("_"))
				puts "Congratulations #{@player2.name}, you won!"
				return
			end
		end while(@wrongGuesses < @allowedGuesses && @keepPlaying === true)
		if(@wrongGuesses >= @allowedGuesses)
			puts "Sorry, you lost. The word was #{@word}. Better luck next time!"
		end
	end

	def playGame()
		
		@word = @player1.pickWord()
		createGuessedWordArray(@word)
		beginGuesses()
		
	end

end

class Dictionary
	def initialize(dictionary)
		@contents = IO.readlines(dictionary)
		
	end
	def getWord
		hasWord = false
		numWords = @contents.length
		while !hasWord do
		
			randNumber = Random.new.rand 
			index = numWords * randNumber
	
			word = @contents[index].chomp

			if(word.length >= 5 || word.length <= 12 )
				hasWord = true
				return word
			end
		end

	end

end

class SavedGame < Game
	def initialize(file)
		@file_name = file
		@isSaved = false
		puts ("Load saved game y/n?")
		ans = gets.chomp
		if ans === "y"
			readGame()
			@isSaved = true
		else
			super()
		end
	end
	def playGame()
		
		if @isSaved
			beginGuesses()
		else
			super()
		end
	end
	def guessLetter(letter)

		if letter == "save"
			saveGame()
			@keepPlaying = false
		else
			super(letter)
		end
	end
	def saveGame()
		wordWithBlanks = ""
		for i in 0...@guessedWord.length
			puts "#{@guessedWord[i]}"
			wordWithBlanks = "#{wordWithBlanks}#{@guessedWord[i]}"
		end
		gameString = "#{@player1.name},#{@player2.name},#{@word},#{@wrongGuesses},#{wordWithBlanks}"
		IO.write(@file_name, gameString)
	end
	def readGame()
		gameArray = IO.read(@file_name).split(",")
		puts gameArray
		@player1 = Player.new(1, gameArray[0]) 
		@player2 = Player.new(2, gameArray[1]) 
		@word = gameArray[2]
		@wrongGuesses = gameArray[3].to_i
		@guessedWord = gameArray[4].split("")
		@allowedGuesses = 6
		@keepPlaying = true
		
	end
end



game = SavedGame.new("game.txt")
game.playGame()
