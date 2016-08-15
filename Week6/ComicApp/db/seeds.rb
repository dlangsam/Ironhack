# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


devorah = User.create!(name: "Devorah", email: "devorah@aol.com", password: "club123", password_confirmation: "club123")
devorah.comics.create(title: "Ruby World", publisher: "Programatic Prog")