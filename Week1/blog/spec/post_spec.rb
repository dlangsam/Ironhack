require_relative("../lib/post.rb")



RSpec.describe 'Post tests' do


 	it "makes sure post.text returns the text of the post" do
  		content = "Today was a good day."
  		post1 = Post.new("Day1", Time.new(2016, 1, 1), content)
    	expect(post1.text).to eq(content)
  end

  it "makes sure post.date returns the date of the post" do
  		time = Time.new(2016, 1, 1)
  		post1 = Post.new("Day1", time, "Test")
    	expect(post1.date).to eq(time)
  end

    it "makes sure post.author returns the author of the post" do
  		time = Time.new(2016, 1, 1)
  		post1 = Post.new("Day1", time, "Test", "misc", "Devorah")
    	expect(post1.author).to eq("Devorah")
  	end
  	it "makes sure post.title returns the title of the post" do
  		time = Time.new(2016, 1, 1)
  		post1 = Post.new("Day1", time, "Test", "misc", "Devorah")
    	expect(post1.title).to eq("Day1")
  	end
  	it "makes sure post.category returns the title of the post" do
  		time = Time.new(2016, 1, 1)
  		post1 = Post.new("Day1", time, "Test", "misc")
    	expect(post1.category).to eq("misc")
  	end

end