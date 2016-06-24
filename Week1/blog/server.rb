#server.rb

require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/post.rb'
require_relative 'lib/blog.rb'

blog = Blog.new
blog.add_post(Post.new("First day of Ironhack", 
	Time.new(2016, 6, 13), "Today was the first day of Ironhack. It was so great to meet everyone."))
blog.add_post(Post.new("TGIF", 
	Time.new(2016, 6, 17), "Made it through the first week. :) Happy hour was so much fun."))
blog.add_post(Post.new("Monday already?" ,
	Time.new(2016, 6, 20 ), "The weekend flew by. Excited to learn Sinatra."))
enable (:sessions)
get "/" do 
	 @user = session[:user]
	@sorted_posts = blog.latest_posts
	erb(:homepage)

end

get "/post_details/?:index?" do 
	index = params[:index]
	if index != nil
		@post_to_show = blog.latest_posts[index.to_i]
		erb(:post)
	else
		redirect to "/"
	end
end

post "/new_post" do
	erb(:create_new_post)
end

post "/publish" do
	title = params[:title]
	content = params[:content]
	category = params[:category]
	author = params[:author]
	blog.add_post(Post.new(title, Time.now, content, category, author))
	redirect to "/"
end

post "/log_in" do

  username = params[:username]
  password = params[:password]

  if username == "Devorah" && password == "password"
  	session[:user] = "Devorah"
  end
  redirect to ("/")
end

post "/log_out" do
	session[:user] = nil
	redirect to ("/")

end









