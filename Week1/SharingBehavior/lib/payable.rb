
# lib/payable.rb

module Payable
  def receive_salary
  	puts @salary
    puts "Huzzah, it's payday! You recieved #{@salary}"
  end
end