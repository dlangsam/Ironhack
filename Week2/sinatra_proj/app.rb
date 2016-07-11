# app.rb

require "sinatra"
require "sinatra/reloader"
require "pry"

get "/" do 
	erb(:home)
	
end

get "/hi" do
	"Hello, world!"
end

get "/about" do
	erb(:about)

end


get "/recipe" do
	@name = "Red velvet cake"
	@ingredients  = ["eggs", "flour", "red food coloring", "cocoa", "buttermilk", "sugar", "cream cheese"]
	erb(:recipe_page)
end
users = {
"devorah" => {:name => "Devorah L", :email => "devorah@awesome.com"},
"jessica" => {:name => "Jessica W", :email => "messyjessi@coolbeans.com"},
"dan" => {:name => "Daniel L", :email => "drdan@newmexico.com"}

}
get "/users/:username" do
	@name = params[:username]
	if @name == "Devorahh"
		erb(:devorah)
	else
		@info = users[@name]
		# binding.pry
		erb(:user_profile)
	end
end