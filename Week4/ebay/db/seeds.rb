# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Adding users"


user1 = User.create(name:"Jessica", email:"jess@mess.com")
user2 = User.create(name:"Arnold", email:"arnie@aol.com")
user3 = User.create(name:"Tabitha", email:"tabbycat@gmail.com")

puts "Done"