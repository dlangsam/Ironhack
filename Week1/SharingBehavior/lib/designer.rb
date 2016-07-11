# lib/designer.rb
require_relative("caffeine_consumer.rb")
require_relative("payable.rb")
class Designer 
  include Caffeinated
  include Payable
  attr_reader :salary
  def initalize
    @salary = 1000
  end
  def design_things
    consume_caffeine
    select_typography
    select_colors
    receive_salary
  end

  def select_typography
    puts "Selecting Comic Sans"
  end

  def select_colors
    puts "Selecting black and white as the colors"
  end
end