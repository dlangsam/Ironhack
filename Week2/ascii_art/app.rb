require "sinatra"
require "sinatra/reloader"
require "artii"
require "pry"
get "/" do 
	"Hello world"
	
end

get "/ascii/:user_word/?:font?/?:secret?" do

	@word = params[:user_word]
	@font = params[:font]
	@has_secret = params[:secret]
	if @font == "special" && @has_secret == "secret" && @word.downcase == "tiger"
		erb(:tiger)
	elsif @font != nil
		@word_printer = Artii::Base.new(:font => @font)
		erb(:show_word)
	else
		@word_printer = Artii::Base.new(:font => "doh")
		erb(:show_word)
	end
	

end