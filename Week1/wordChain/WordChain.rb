require "ruby-dictionary"


class  WordChain 
    def  initialize 
         @dictionary = Dictionary.from_file("/usr/share/dict/words")
     end 

      def  find_chain(word1, word2)
      	puts word1
      	if word1.length != word2.length
      		puts "Words must be the same length"
      	else
      		letters = word1.length
      		current_word = word1
      		while current_word != word2
      			for i in 0...letters
      				if current_word[i] == word2[i]
      					next
      				else
      					temp_letter = current_word[i]
      					current_word[i] = word2[i]
      					puts "maybe  #{current_word}"
      					if !@dictionary.exists? current_word
      						current_word[i] = temp_letter
      					else
      						puts current_word
      					end
      				end
      			end
      		end
      	end
         # Write your algorithm here 
    end 
end


my_chain = WordChain.new

puts "Starting word?:"
word1 = gets.chomp
puts "Ending word?:"
word2 = gets.chomp
my_chain.find_chain(word1, word2)