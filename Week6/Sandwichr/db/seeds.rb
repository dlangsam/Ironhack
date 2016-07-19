# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



italian = Sandwich.create!(name: "Italian", bread_type: "Multi-grain hoagie")
blt = Sandwich.create!(name: "BLT", bread_type: "Rye")
cheese_steack = Sandwich.create!(name: "Philly Cheese Steak", bread_type: "French bread")


tomato = Ingredient.create!(name: "Tomato", calories: 20)
lettuce = Ingredient.create!(name: "Lettuce", calories: 15)
onions = Ingredient.create!(name: "Onion", calories: 15)
peppers = Ingredient.create!(name: "Pepper", calories: 20)
salami = Ingredient.create!(name: "Salami", calories: 120)
ham = Ingredient.create!(name: "Ham", calories: 100)
bacon = Ingredient.create!(name: "Bacon", calories: 120)
turkey = Ingredient.create!(name: "Turkey", calories: 90)
steak = Ingredient.create!(name: "Steak", calories: 110)
mozarella = Ingredient.create!(name: "Mozarella Cheese", calories: 120)
swiss = Ingredient.create!(name: "Swiss Cheese", calories: 100)
pepper_jack = Ingredient.create!(name: "Pepper Jack Cheese", calories: 110)

italian.ingredients.push( salami)
blt.ingredients.push( bacon )
cheese_steack.ingredients.push( steak)

