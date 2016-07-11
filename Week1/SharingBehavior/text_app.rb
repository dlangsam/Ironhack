require_relative("lib/textProcessor.rb")

# puts "Please log into the word processor"
# puts "Username:"
# username = gets.chomp
# puts "Password"
# password = gets.chomp

# passwordChecker = PasswordAuthenticater.new
# if !passwordChecker.authenticate(username, password) 
# 	puts "Incorrect login. Goodbye."
# else
# 	myWord = TextProcessor.new
# 	puts "Please begin typing..."
# 	input = gets.chomp
# 	myWord.countWords(input)
# end

myWord = TextProcessor.new