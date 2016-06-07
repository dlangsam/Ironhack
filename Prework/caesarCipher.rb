

#Iteration1
def solve_cipher1(input)
  length = input.length
  i = 0
  while i < length
  	codedVal = input[i].ord

  	if codedVal == 32
  		i += 1
  		next
  	end

  	codedVal -= 1
  	if codedVal == 64 
  		codedVal = 90
  	elsif codedVal == 96
  		codedVal = 122
  	end
  	input[i] = codedVal.chr
  	i +=1
  end
  return input

end

#Iteration2
def solve_cipher2(input, step)
  length = input.length
  i = 0
  while i < length
  	codedVal = input[i].ord

  	if codedVal == 32
  		i += 1
  		next
  	end

  	codedVal += step
  	if codedVal == 64 
  		codedVal = 90
  	elsif codedVal == 96
  		codedVal = 122
  	end
  	input[i] = codedVal.chr
  	i +=1
  end
  return input
end

#Iteration3
def solve_cipher3(input)
  length = input.length
  i = 0
  while i < length
  	codedVal = input[i].ord
  	if codedVal == 32
  		i += 1
  		next
  	end

  	codedVal -= 3
  	if codedVal == 64 
  		codedVal = 90
  	elsif codedVal == 96
  		codedVal = 122
  	end
  	input[i] = codedVal.chr
  	i +=1
  end
  return input
end

puts solve_cipher1("ifmmp")
puts solve_cipher2("p| uhdo qdph lv grqdog gxfn", -3)
puts solve_cipher3("p| uhdo qdph lv grqdog gxfn")