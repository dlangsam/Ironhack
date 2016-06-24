require_relative("../lib/blog.rb")
require_relative("../lib/post.rb")


RSpec.describe 'Blog tests' do


  let :blog do 
    Blog.new
  end
  let :post1 do
	Post.new("First day of Ironhack", 
	Date.new(2016, 6, 13), "Today was the first day of Ironhack. It was so great to meet everyone.")
  end
   let :post2 do
	Post.new("TGIF", 
	Time.new(2016, 6, 17), "Made it through the first week. :) Happy hour was so much fun.")
  end
   let :post3 do
	Post.new("Monday already?" ,
	Time.new(2016, 6, 20 ), "The weekend flew by. Excited to learn Sinatra.")
  end

  it "blog.posts returns an array of posts" do
  	posts = [post1, post2, post3]
  	posts.each do |post|
  		blog.add_post(post)
  	end
    expect(blog.posts).to eq (posts)
  end

   it "blog.posts returns an array of posts in order" do
  	posts = [post1, post2, post3]
  	posts.each do |post|
  		blog.add_post(post)
  	end
    expect(blog.latest_posts).to eq ([post3, post2, post1])
  end

end