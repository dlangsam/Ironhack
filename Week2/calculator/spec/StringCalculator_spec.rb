require_relative("../lib/StringCalculator.rb")

RSpec.describe StringCalculator do

	before :each do
		@calc = StringCalculator.new
	end

	it "returns 0 for empty string" do
		
		expect(@calc.add("")).to eq(0)
	end

	it "returns the number for a single digit" do
		
		expect(@calc.add("3")).to eq(3)

	end

	it "returns 2 numbers added together" do
		
		expect(@calc.add("3,4")).to eq(7)
		expect(@calc.add("5,4")).to eq(9)
	end
	it "returns more than 2 numbers added together" do
		
		expect(@calc.add("5,4,10")).to eq(19)
		expect(@calc.add("5,-4,10")).to eq(11)
	end
	it "returns more than 2 numbers added together using different characters" do
		
		expect(@calc.add("5&4,12")).to eq(21)
		expect(@calc.add("5+-4+10")).to eq(11)
	end

end
# the_calculator = StringCalculator.new

# p the_calculator.add("") == 0

# p the_calculator.add("6") == 6
# p the_calculator.add("9") == 9


# p the_calculator.add("5,7") == 12
# p the_calculator.add("4,3") == 7

# p the_calculator.add("5,7,10") == 22
# p the_calculator.add("4,3,20") == 27

# p the_calculator.add("5&7") == 12
# p the_calculator.add("4&3") == 7

# p the_calculator.add("5,7&10") == 22
# p the_calculator.add("4&3,20") == 27


# p the_calculator.add("4,-20") == -16