require_relative("post.rb")
require 'colorize'

class Blog
	def initialize
		@post_list = []
		@current_page = 1
		@posts_per_page = 3
		@num_pages = 1
	end
	def add_post(post)
		@post_list.push(post)
	end
	def go_next()
		if @current_page < @num_pages
	 		@current_page += 1
	 	end
	end
	def go_previous()
		if @current_page > 1
	 		@current_page -= 1
	 	end
	end
	 def publish_front_page
	 	sorted_posts = @post_list.sort{|post1, post2| post2.date <=> post1.date}
	 	@num_pages = (sorted_posts.length/@posts_per_page.to_f).ceil


	 	input = nil
		#start_index = 0; end_index = 2;
	 	while(input != "exit")
	 			if input == "next"
	 				go_next()
	 			elsif input == "prev"
	 				go_previous()
	 			end
	 			start_index = @current_page * @posts_per_page - @posts_per_page
	 			end_index = @current_page * @posts_per_page - 1

	 			
	 			page_of_posts = sorted_posts[start_index..end_index];
				page_of_posts.each do |post|
					post.print_page
				end
				for i in 1..@num_pages
					if i == @current_page
						print "#{i} ".colorize(:blue)
					else
						print "#{i} "
					end
				end
				print "\n>"
				input = gets.chomp();
		end
		
	end
end

