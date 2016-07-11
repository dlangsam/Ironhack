class PasswordAuthenticater
	def initialize
		@username = "devorah"
		@password = "club123"
	end
	def authenticate(username, password)
		if(username != @username)
			false
		elsif(password != @password)
			false
		else
			true
		end
	end
end



class TextProcessor
	def initialize
		puts "Please log into the word processor"
		puts "Username:"
		username = gets.chomp
		puts "Password"
		password = gets.chomp

		passwordChecker = PasswordAuthenticater.new
		if !passwordChecker.authenticate(username, password) 
			puts "Incorrect login. Goodbye."
		else
			puts "Please begin typing..."
			input = gets.chomp
			countWords(input)
		end
	end
	def countWords(words)
		wordArray = words.split(" ")
		puts "There are #{wordArray.length} words."
	end	
end