#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Cleaning database..."
Equipment.destroy_all
User.destroy_all

puts "Creating users..."
user1 = User.create!(name: "Winnie", email: "w@w.com", password: "winnie", description: "This is a user account with offerings")
user2 = User.create!(name: "Elvis", email: "e@e.com", password: "elvis", description: "This is a user account without offerings")

puts "Creating equipment..."
equipment1 = Equipment.create!(title: "Tub grab bar", category: "bathroom", product: "bath and grab rails", population: "any", condition: 0, description: "Doesn't fit my tub", location: Faker::Address.full_address)
equipment1.user = user1
equipment2 = Equipment.create!(title: "Under-bed rail", category: "bedroom", product: "bed support and transfer", population: "any", condition: 2, description: "don't need no more", location: Faker::Address.full_address)
equipment2.user = user1
equipment3 = Equipment.create!(title: "PAL classroom chair - size 2", category: "productivity", product: "activity chair", population: "pediatric", condition: 0, description: "grown out of it", location: Faker::Address.full_address)
equipment3.user = user1
equipment4 = Equipment.create!(title: "Scooter", category: "mobility", product: "mobility scooters", population: "adult", condition: 3, description: "needs a new battery", location: Faker::Address.full_address)
equipment4.user = user1
equipment5 = Equipment.create!(title: "wheelchair with roho cushion", category: "mobility", product: "wheelchair", population: "adult", condition: 0, description: "comes with instructions to calibrate cushion", location: Faker::Address.full_address)
equipment5.user = user1
equipment6 = Equipment.create!(title: "Metal crutches", category: "mobility", product: "crutches", population: "adult", condition: 0, description: "recovered and no longer need", location: Faker::Address.full_address)
equipment6.user = user1

puts "All done!"
