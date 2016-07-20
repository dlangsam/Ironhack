# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Adding users"


# user1 = User.create(name:"Jessica", email:"jess@mess.com")
# user2 = User.create(name:"Arnold", email:"arnie@aol.com")
# user3 = User.create(name:"Tabitha", email:"tabbycat@gmail.com")


tiffany = User.create(name:"Tiffany", email:"tiffany@gmail.com")

michael = User.create(name:"Michael", email:"michael@gmail.com")

bracelet = Product.create(title: "Silver bracelet", description:"must-have", deadline: "2016-08-24 00:00:00")
ring = Product.create(title: "Ring", description:"gold", deadline: "2016-08-25 00:00:00")
earrings = Product.create(title: "Silver earrings", description:"dangly", deadline: "2016-08-26 00:00:00")
necklace = Product.create(title: "Diamond necklace", description:"very sparkly", deadline: "2016-08-27 00:00:00")

tiffany.products.push(bracelet)
tiffany.products.push(ring)
tiffany.products.push(earrings)
tiffany.products.push(necklace)

SellerReview.create(author_id: michael.id, subject_id: tiffany.id, product_id: ring.id, review_content: "Disgusting", star_rating: 2)



puts "Done"