puts "Deleting equipment..."
Equipment.destroy_all

puts "Deleting ingredients..."
Ingredient.destroy_all

puts "Deleting recipes..."
Recipe.destroy_all

puts "Deleting users..."
User.destroy_all


puts "Generating equipment..."
20.times do
  Equipment.create(name: Faker::Appliance.equipment)
end

puts "Generating ingredients..."
50.times do
  Ingredient.create(name: Faker::Food.ingredient)
end

puts "Generating users..."
User.create(email: 'j@j.j', password: 'jjjjjj', username: 'jro', first_name: 'Jethro', last_name: 'Williams', profile_picture: 'https://res.cloudinary.com/dftybtoej/image/upload/v1542027237/stock_photo.jpg', admin: true)
User.create(email: 'p@p.p', password: 'pppppp', username: 'pro', first_name: 'Pethro', last_name: 'Milliams', profile_picture: 'https://res.cloudinary.com/dftybtoej/image/upload/v1542031690/coming_soon.jpg', admin: false)
18.times do
  User.create(email: Faker::Internet.email, password: Faker::Internet.password, username: Faker::Internet.username, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, profile_picture: 'https://picsum.photos/200/300', admin: false)
end

# puts "Generating recipes..."
# 20.times do
#   Recipe.create()
# end

puts "Finished seeding"
