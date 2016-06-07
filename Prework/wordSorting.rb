def sortSentences(sentence)
	sentenceArray = sentence.split(" ")
	for s in sentenceArray
		
		s.gsub!(/\p{^Alnum}/, '')
	end
	newArray = sentenceArray.sort{|left, right| left.upcase <=> right.upcase}
	return newArray
end


print sortSentences("Have a nice day.") 
print sortSentences("Fools fall for foolish follies.")
print sortSentences("Ruby is a fun language!")