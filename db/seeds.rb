# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

Item.destroy_all
# User.destroy_all

20.times do |a|
    a = Item.create(title: Faker::Creature::Cat.breed + " #{rand(1..1000)}", description: "a #{['big', 'little', 'medium-sized'].sample + " and " + ["lovely", "pretty", 'beautiful', 'gorgeous']. sample} catty which his first words were : '#{Faker::Quote.yoda}'", price: rand(5..20), image_url: "not delivered yet")
end

puts 'seeds loaded'