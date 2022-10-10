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
equipment1 = Equipment.create!()
