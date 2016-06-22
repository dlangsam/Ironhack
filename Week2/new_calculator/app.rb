require "sinatra"
require_relative("lib/calculator.rb")
require_relative("lib/memory_saver.rb")

my_memory = Memory.new

get "/the_calculator" do
	@memory_number = my_memory.load
	erb(:calculator)
end
get "/add" do 
	erb(:add)
end
get "/subtract" do
	erb(:subtract)
end

post "/performed_calculation" do
	@calc = Calculator.new
	operation = params[:operation]
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  	@result = 0
  	if operation == "addition"
   		@result = @calc.add(first, second)

	elsif operation == "subtraction"
		@result = @calc.subtract(first, second)

	elsif operation == "multiplication"
		@result = @calc.multiply(first, second)

	elsif operation == "division"
		@result = @calc.divide(first, second)

	end
	erb(:results)
end

post "/save_to_memory" do
	my_memory.save(params[:result])

  redirect to("/the_calculator")
end

# post "/calculate_add" do
# 	calc = Calculator.new
# 	"Params data: " + params.inspect
#   first = params[:first_number].to_f
#   second = params[:second_number].to_f
#    result = calc.add(first, second)
#   "#{first} + #{second} = #{result}"
# end


# post "/calculate_subtract" do
# 		calc = Calculator.new
# 	"Params data: " + params.inspect
#   first = params[:first_number].to_f
#   second = params[:second_number].to_f
#    result = calc.subtract(first, second)
#   "#{first} - #{second} = #{result}"
# end