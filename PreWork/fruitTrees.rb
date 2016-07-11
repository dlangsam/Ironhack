class Fruit
  attr_reader :diameter
  def initialize
    @diameter = 5
  end
end

class Apple < Fruit
 def initialize
    @diameter = 1 + Random.new.rand * 4 
  end  
end

class Orange < Fruit
  def initialize
    @diameter = 2 + Random.new.rand * 5 
  end  
end

class Pear < Fruit
  def initialize
    @diameter = 3 + Random.new.rand * 2 
  end  
end


class FruitTree
attr_reader :age
  attr_reader :height
  attr_reader :dead
  attr_reader :type
  def initialize

    @age = 0
    @height = 0
    @dead = false
    @numFruit = 0
    @type = "FruitTree"
  end
  def age!
    @age +=1
  end

  def any_fruit?
    !@dead && @numFruit > 0
  end

  def dead?
    @dead
  end

  def pick_Fruit!
      if @numFruit > 0
        @numFruit -= 1
        Fruit.new
      else
        "NoFruitError"
      end
  end
end
class AppleTree < FruitTree
  def initialize
    super()
    @type = "Apple Tree"
  end
  def age!
      super()
      if (@age <= 25)
        @height += 1.5
        @numFruit = (@age)**3
      elsif @age == 26
        @dead = true
      end
  end

  def any_fruit?
   @age > 1 && !@dead && @numFruit > 0
  end

  def pick_Fruit!
      if @numFruit > 0
        @numFruit -= 1
        Apple.new
      else
        "NoApplesError"
      end
  end
end
class PearTree < FruitTree
  def initialize
    super()
      @type = "Pear Tree"
  end
  def age!
      super()
      if (@age <= 20)
        @height += 3
        @numFruit = (@age)**2 + 3
      elsif @age == 21
        @dead = true
      end
  end

  def any_fruit?
    @age > 4 && !@dead && @numFruit > 0
  end

  def pick_Fruit!
      if @numFruit > 0
        @numFruit -= 1
        Pear.new
      else
        "NoPearsError"
      end
  end
end



class OrangeTree < FruitTree
	def initialize
    super()
     @type = "Orange Tree"
  end
  def age!
  		super()
  		if (@age <= 17)
  			@height += 2
  			@numFruit = -1*(@age)**2 + 20*@age - 50
  		elsif @age == 18
  			@dead = true
  		end
  end

  	def any_fruit?
  		@age > 2 && !@dead && @numFruit > 0
  	end

  	def pick_an_orange!
  		if @numFruit > 0
  			@numFruit -= 1
  			Orange.new
  		else
  			"NoOrangesError"
  	  end

    end
end

class TreeGrove
  attr_reader :grove
  def initialize
    @grove = []
  end
  def addTree(tree)
    grove.push(tree)
  end
  def age!
    @grove.each do |tree|
      tree.age!
    end
  end

  def trees
    return @grove
  end

  def getMatureTrees
    matureTrees = []
      @grove.each do |tree|
      if tree.any_fruit?
        matureTrees.push(tree)
      end
    end
    return matureTrees
end

  def getDeadTrees
    deadTrees = []
      @grove.each do |tree|
      if tree.dead?

        deadTrees.push(tree)
      end
    end
    return deadTrees
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



grove = TreeGrove.new

appleTree1 = AppleTree.new
orangeTree1 = OrangeTree.new
grove.addTree(appleTree1)
grove.addTree(orangeTree1)
grove.age!

appleTree2 = AppleTree.new
orangeTree2 = OrangeTree.new
pearTree1 = PearTree.new
grove.addTree(appleTree2)
grove.addTree(orangeTree2)
grove.addTree(pearTree1)
grove.age!

appleTree3 = AppleTree.new
appleTree4 = AppleTree.new
orangeTree3 = OrangeTree.new
pearTree2 = PearTree.new
grove.addTree(appleTree3)
grove.addTree(appleTree4)
grove.addTree(orangeTree3)
grove.addTree(pearTree2)
grove.age!


while grove.getDeadTrees != grove.trees && grove.getMatureTrees.length > 0
  grove.grove.each do |tree|
    puts "Tree is #{tree.age} years old and #{tree.height} feet tall"
    basket = []

  # It places the oranges in the basket
  # IT PLACES THE ORANGES IN THE BASKET
    while tree.any_fruit?
      basket << tree.pick_Fruit!
    end

  avg_diameter = 0
  if basket.length > 0
  avg_diameter = getAvgDiameter(basket)# It's up to you to calculate the average diameter for this harvest.
  end 
  puts "#{tree.type}"
  puts "Year #{tree.age} Report"
  puts "Tree height: #{tree.height} feet"
  puts "Harvest:     #{basket.size} fruits with an average diameter of #{avg_diameter} inches"
  puts ""

  end
  grove.age!
end
