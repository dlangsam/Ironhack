class Orange
  attr_reader :diameter
  def initialize
    @diameter = Random.new.rand * 7
  end
  
end


class OrangeTree
	attr_reader :age
	attr_reader :height
	attr_reader :dead
	def initialize
		@age = 0
		@height = 0
		@dead = false
		@numOranges = 0
  	end
  	def age!
  		@age += 1
  		if (@age <= 17)
  			@height += 2
        #@numOranges = 5
  			@numOranges = -1*(@age)**2 + 20*@age - 50
  		elsif @age == 18
  			@dead = true
  		end
  	end

  	def any_oranges?
  		if @age > 2 && @numOranges > 0
  			true
  		else
  			false
  		end
  	end


    def dead?
      @dead
    end

  	def pick_an_orange!
  		if @numOranges > 0
  			@numOranges -= 1
  			Orange.new
  		else
  			"NoOrangesError"
  	end

end
end



def getAvgDiameter(basketOfOranges)
	total_diameter = 0
	numOranges = basketOfOranges.length
	basketOfOranges.each do |orange|
		total_diameter += orange.diameter
	end
  total_diameter / numOranges
end


tree = OrangeTree.new

tree.age! until tree.any_oranges?

puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

until tree.dead?
  basket = []

  # It places the oranges in the basket
  # IT PLACES THE ORANGES IN THE BASKET
  while tree.any_oranges?
    basket << tree.pick_an_orange!
  end

  avg_diameter = getAvgDiameter(basket)# It's up to you to calculate the average diameter for this harvest.

  puts "Year #{tree.age} Report"
  puts "Tree height: #{tree.height} feet"
  puts "Harvest:     #{basket.size} oranges with an average diameter of #{avg_diameter} inches"
  puts ""

  # Age the tree another year
  tree.age!
end

puts "Alas, the tree, she is dead!"
