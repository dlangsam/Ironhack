require 'date'

class ShoppingCart
  def initialize
    @items = []
  end
   def  add_item (item)
    @items.push(item)
   end
   def checkout
    total = 0
    @items.each do |item|
      total += item.price
    end
    if @items.size > 5
      total = 0.9 * total
    end
    total
  end
end
class Shop
	attr_reader :inventory
	def initialize
		@inventory = []
	end
	def add_inventory(item)
		@inventory.push(item)
	end
end

class Item 
	attr_reader :name, :price
  def initialize(name, price)
      @name = name
      @price = price
  end

  def price
     @price
  end
end

class Houseware < Item
  def price
      if(@price >  100)
      	@price * 0.95
      else 
      	@price
      end
  end
end

class Fruit < Item
  def price
  		if Date.today.saturday? || Date.today.sunday?
  		  @price * 0.9
  		else
  		  @price
  		end
  end
end


my_shop = Shop.new
banana = Fruit.new("Banana", 10)
orange_juice = Fruit.new("Orange Juice", 10)
rice = Item.new("Rice", 1)
vacuum = Houseware.new("Vacuum Cleaner", 150)
anchovies = Item.new("Anchovies", 2)

my_shop.add_inventory(banana)
my_shop.add_inventory(orange_juice)
my_shop. add_inventory(rice)
my_shop.add_inventory(vacuum)
my_shop.add_inventory(anchovies)


for item in my_shop.inventory
	puts item.price
end

joshs_cart = ShoppingCart.new
joshs_cart.add_item(orange_juice)
joshs_cart.add_item(rice)
puts joshs_cart.checkout

devs_cart = ShoppingCart.new
devs_cart.add_item(orange_juice)
devs_cart.add_item(rice)
devs_cart.add_item(vacuum)
devs_cart.add_item(orange_juice)
devs_cart.add_item(banana)
devs_cart.add_item(banana)
puts devs_cart.checkout
