class TextInspectionController < ApplicationController
	def new
		render 'new'
	end

	def create
    	 @text = params[:text_inspection][:user_text]
    
    	 @word_count = @text.split(" ").length
    	 @minutes = @word_count / 275
    	 @top_words = count_word_freq(@text)
		 render "results"
  	end

  	#this should eventually be part of a model

  	def count_word_freq(string)
      string = string.downcase.gsub(/[^a-z0-9\s]/i, '')
  		words = string.split(/\s|\W/)
  		freq_map = Hash.new
  		words.each do |word|


  			if !freq_map.has_key?word 
  				occurences = words.select do |search_word|
  					search_word == word
  				end
  				freq_map[word] = occurences.length
  			end
  		end
  		puts freq_map
  		sorted_hash = freq_map.sort_by{|k,v| -v};

  		count = 0
  		top_words = []
  		sorted_words = sorted_hash
  		while (count < sorted_words.length && count < 10)
  			top_words.push(sorted_words[count][0])
  			count = count + 1
  		end
  		return top_words



  	end

end
