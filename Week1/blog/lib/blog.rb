require_relative("post.rb")
require 'colorize'

class Blog
	def initialize
		@post_list = []
	end
	def add_post(post)
		@post_list.push(post)
	end
	 def publish_front_page
	 	sorted_posts = @post_list.sort{|post1, post2| post2.date <=> post1.date}
	 	num_pages = sorted_posts.length/3 + 1


	 	input = nil
		#start_index = 0; end_index = 2;
		current_page = 1 
	 	while(input != "exit")
	 			if input == "next"
	 				if current_page < num_pages
	 				 current_page += 1
	 				end
	 			elsif input == "prev"
	 				if current_page > 1
	 					current_page -= 1
	 				end
	 			end
	 			start_index = current_page * 3 - 3
	 			end_index = current_page * 3 - 1

	 			
	 			three_posts = sorted_posts[start_index...end_index];
				three_posts.each do |post|
					post.print_page
				end
				for i in 1..num_pages
					if i == current_page
						print "#{i}".colorize(:blue)
					else
						print i
					end
				end
				print "\n>"
				input = gets.chomp();
		end
		
	end
end

