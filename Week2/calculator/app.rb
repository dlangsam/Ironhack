#app.rb

require_relative("lib/StringCalculator.rb")
the_calculator = StringCalculator.new

p the_calculator.add("") == 0

p the_calculator.add("6") == 6
p the_calculator.add("9") == 9


p the_calculator.add("5,7") == 12
p the_calculator.add("4,3") == 7

p the_calculator.add("5,7,10") == 22
p the_calculator.add("4,3,20") == 27

p the_calculator.add("5&7") == 12
p the_calculator.add("4&3") == 7

p the_calculator.add("5,7&10") == 22
p the_calculator.add("4&3,20") == 27


p the_calculator.add("4,-20") == -16