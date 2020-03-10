# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

CartItem.destroy_all
Cart.destroy_all
Item.destroy_all
User.destroy_all
Order.destroy_all
OrderItem.destroy_all


count = 0
20.times do |a|
	count += 1
    a = Item.create(id: count, title: Faker::Creature::Cat.breed + " #{rand(1..1000)}", description: "a #{['big', 'little', 'medium-sized'].sample + " and " + ["lovely", "pretty", 'beautiful', 'gorgeous']. sample} catty which his first words were : '#{Faker::Quote.yoda}'", price: rand(5..20), image_url: "not delivered yet")
end

count = 0

20.times do |user|
	count += 1
	user = User.new
	user.id = count 
	user.email = Faker::Name.first_name + '.' + Faker::Name.last_name + '@yopmail.com'
	user.password = 'e-kitty'
	user.save
end

# count = 0
# 20.times do |cart|
# 	count += 1
# 	cart = Cart.create(id: count, user: User.find(count))
# end
# count = 0
50.times do |cart_items|
 	count += 1
 	cart_items = CartItem.create(id: count, item: Item.find(rand(1..20)), cart: Cart.all[rand(0..19)])
end

20.times do 
	order = Order.new
	order.user = User.all[rand(0..19)]
	order.save
end

75.times do
	order_item = OrderItem.new
	order_item.item = Item.all[rand(0..19)]
	order_item.order = Order.all[rand(0..19)]
	order_item.save
end

puts 'seeds loaded'
