# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Adding contacts"

c1 = Contact.create(name: "Elmo", address: "123 Sesame Street, New York, NY", phone_number: "9450218812", email: "elmo@pbs.org")
c2 = Contact.create(name: "Barbie", address: "100 Dream House, Hollywood, FL", phone_number:"8332039312", email: "barbie@mattel.com")
c3 = Contact.create(name: "Mario", address: "54 Pipe Lane, Venice, Italy", phone_number: "9224298745", email: "mario@plumbers.net")

puts "Done"