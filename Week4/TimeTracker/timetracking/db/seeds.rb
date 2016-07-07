# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating 3 projects"

projectA = Project.create(name: "Soccer", description: "Kick a ball into the net")
projectB = Project.create(name: "Friendship bracelets")
projectC = Project.create(name: "Story writing", description: "Write a kickass story")
projectD = Project.create(name: "Glass blowing", description: "Make something cool out of glass")
projectE = Project.create(name: "Volleyball")
projectF = Project.create(name: "Water skiing", description: "Skiing behind a boat on the lake")
projectG = Project.create(name: "Basket weaving", description: "Turn straw into a basket")
projectH = Project.create(name: "Woodworking")
projectI = Project.create(name: "Tie Dye", description: "Transform a boring white tee into a colorful masterpiece")
projectJ = Project.create(name: "Ceramics")
projectK = Project.create(name: "Lanyard", description: "Tie knots in lanyard to make a keychain")

TimeEntry.create(project_id: projectI.id, hours: 1, minutes: 30, comments: "Made a cool t-shirt", date: Time.now )
TimeEntry.create(project_id: projectH.id, hours: 4, minutes: 20, comments: "Built a shelf", date: Time.now )
TimeEntry.create(project_id: projectK.id, hours: 0, minutes: 30, comments: "Learned box stitch", date: Time.now )
TimeEntry.create(project_id: projectH.id, hours: 1, minutes: 30, comments: "Painted the shelf purple", date: Time.now )
TimeEntry.create(project_id: projectF.id, hours: 2, minutes: 0, comments: "Learned to stand up on water skis", date: Time.now )

puts("done")