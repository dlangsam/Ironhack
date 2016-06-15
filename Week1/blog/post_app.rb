require_relative("lib/post.rb")
require_relative("lib/blog.rb")
require 'date'

blog = Blog.new
blog.add_post Post.new( "Hello World", Date.new(1989, 5, 7),
 "I was born today, what an awesome day!")
blog.add_post SponsoredPost.new( "Devorah goes to Glenwood", Date.new(1994, 9, 5), "My first day of kindergarten.")
blog.add_post Post.new("Road trip", Date.new(2004, 6, 18), "Going on a tour across the USA. Grand canyon here I come!")
blog.add_post Post.new("Israel trip", Date.new(2005, 6, 23), "Heading on a trip to Poland and Israel")
blog.add_post Post.new("My first boyfriend", Date.new(2006, 12, 26), "I started dating my first boyfriend Mitch")
blog.add_post SponsoredPost.new("High school graduation", Date.new(2007, 6, 15), "College here I come")
blog.add_post Post.new("Wash U Gradiation", Date.new(2011, 5, 20), "Grad school here I come")
blog.add_post Post.new("Move to Miami", Date.new(2015, 8, 1), "Hello Palm Trees")
blog.publish_front_page


