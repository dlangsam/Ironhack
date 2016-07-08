# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Adding concerts"


Concert.create(artist: "The Bacon Brothers", venue: "The Pageant", city: "St. Louis", 
	date: DateTime.new(2016, 7, 8), price: 30.00, description: "Let's hear for the Bacon")
Concert.create(artist: "The Beastie Boys", venue: "Bayfront Park Ampitheater", city: "Miami", 
	date: DateTime.new(2016, 7, 8), price: 78.00, description: "Fight for your right to part-taaay!")
Concert.create(artist:"Macklemore", venue: "Madison Square Garden", city: "New York", 
	date: DateTime.new(2016, 7, 10), price: 80.00, description: "with Ryan Lewis")
Concert.create(artist: "Adele", venue: "The Pageant", city: "St. Louis", 
	date: DateTime.new(2016, 7, 12), price: 30.00, description: "Rolling in the deep")
Concert.create(artist: "Britney Spears", venue: "Bayfront Park Ampitheater", city: "Miami", 
	date: DateTime.new(2016, 7, 13), price: 78.00, description: "It's Britney, bitch.")
Concert.create(artist:"Taylor Swift", venue: "Madison Square Garden", city: "New York", 
	date: DateTime.new(2016, 7, 8), price: 120.00, description: "Shake It Off")
puts "Done"