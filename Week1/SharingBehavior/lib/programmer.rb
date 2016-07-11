# lib/programmer.rb
require_relative("caffeine_consumer.rb")
require_relative("payable.rb")
class Programmer 
	include Caffeinated
	include Payable
    attr_reader :salary
	def initalize
		@salary = 2000
	end
  def program
    consume_caffeine
    do_wonderful_things_with_computers
    receive_salary
  end

  def do_wonderful_things_with_computers
    puts "Coding wonderful things!"
  end
end