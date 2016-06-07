class MilkShake
	attr_reader :flavor
  def initialize(flavor)
  	@flavor = flavor
   @base_price = 3
   @ingredients = [ ]
  end
  def add_ingredient(ingredient)
    @ingredients.push(ingredient)
  end

  def price_of_milkshake
  #Let's establish what our counter should be before we start adding ingredients into the mix
  total_price_of_milkshake = @base_price
  #Add each ingredients price to our total
  @ingredients.each do |ingredient|
    total_price_of_milkshake += ingredient.price
  end
  #return  our total price to whoever called for it
   total_price_of_milkshake
end
end

class Ingredient
 attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end
end

class ShakeShop
	def initialize()
		@milkshake_menu = [ ]
	end
	def addNewMilkshake(milkshake)
		 @milkshake_menu.push(milkshake)
	end
	def showCompleteMenu
		@milkshake_menu.each do |milkshake|
			puts "#{milkshake.flavor} : #{milkshake.price_of_milkshake}"
		end

	end
end


banana = Ingredient.new("Banana", 2)
chocolate_chips = Ingredient.new("Chocolate Chips", 1)
brownie = Ingredient.new("Brownie", 2)
cookie_dough = Ingredient.new("Cookie Dough", 2)
oreo = Ingredient.new("Oreo", 1)
strawberry = Ingredient.new("Strawberry", 1)



nizars_milkshake = MilkShake.new "Chunky Monkey"
nizars_milkshake.add_ingredient(banana)
nizars_milkshake.add_ingredient(chocolate_chips)
puts nizars_milkshake.price_of_milkshake

half_baked = MilkShake.new"Half Baked"
half_baked.add_ingredient(cookie_dough)
half_baked.add_ingredient(brownie)


choco_strawberry = MilkShake.new"Chocolate Strawberry"
choco_strawberry.add_ingredient(strawberry)
choco_strawberry.add_ingredient(chocolate_chips)

cookies_n_cream = MilkShake.new"Cookies 'n Cream"
cookies_n_cream.add_ingredient(oreo)


my_shake_shop = ShakeShop.new
my_shake_shop.addNewMilkshake(nizars_milkshake)
my_shake_shop.addNewMilkshake(half_baked)
my_shake_shop.addNewMilkshake(choco_strawberry)
my_shake_shop.addNewMilkshake(cookies_n_cream)

my_shake_shop.showCompleteMenu


