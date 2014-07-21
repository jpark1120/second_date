# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.delete_all
# Flag.delete_all
# Spot.delete_all

@array = Spot.explore

@array.each do |restaurant|

Spot.create({
  name: restaurant["venue"]["name"],
  address: restaurant["venue"]["location"]["address"],
  description: restaurant["venue"]["categories"][0]["name"],
  rating: restaurant["venue"]["rating"],
  price: restaurant["venue"]["price"]["tier"],
  hours: restaurant["venue"]["hours"]["status"],
  tip: restaurant["tips"][0]["text"]
  })

end

# restaurant["venue"]["categories"].each do |type|
#   type["name"]
# end