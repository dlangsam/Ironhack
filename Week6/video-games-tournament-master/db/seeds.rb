# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


player1 = Player.create(name: "Devorah")
player2 = Player.create(name: "Dan")
player3 = Player.create(name: "Jessica")
player4 = Player.create(name: "Joe")
player5 = Player.create(name: "Betty")
player6 = Player.create(name: "Michael")

game1 = Tournament.create(name: "Family Olympics")
game2 = Tournament.create(name: "Golf")
game3 = Tournament.create(name: "Beer Pong")

game1.players.push(player1)
game1.players.push(player2)
game1.players.push(player3)
game1.players.push(player4)
game1.players.push(player5)


game2.players.push(player1)
game2.players.push(player4)
game2.players.push(player5)
game2.players.push(player6)

game3.players.push(player1)
game3.players.push(player6)