class Post
	attr_reader :title, :date, :text, :category, :author
	def initialize(title, date, text, category = "general", author = "anonymous")
		@title = title
		@date = date
		@text = text
		@category = category
		@author = author
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