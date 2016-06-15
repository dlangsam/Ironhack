class Post
	attr_reader :title, :date, :text
	def initialize(title, date, text)
		@title = title
		@date = date
		@text = text
	end
	def print_page
		puts @title
		puts "**************"
		puts @text
		puts "----------------"
	end

end


class SponsoredPost < Post
	def print_page
		puts "****** #{@title} *****"
		puts "**************"
		puts @text
		puts "----------------"
	end
end