puts "Deleting equipment..."
Equipment.destroy_all

puts "Deleting ingredients..."
Ingredient.destroy_all

puts "Deleting recipes..."
Recipe.destroy_all

puts "Deleting users..."
User.destroy_all

puts "Deleting reviews..."
Review.destroy_all

puts "Deleting user ratings..."
UserRating.destroy_all

puts "Generating equipment..."
20.times do
  Equipment.create(name: Faker::Appliance.equipment)
end

puts "Generating ingredients..."
50.times do
  Ingredient.create(name: Faker::Food.ingredient)
end

puts "Generating users and recipes..."
u1 = User.new(email: 'j@j.j', password: 'jjjjjj', username: 'jro', first_name: 'Jethro', last_name: 'Williams', profile_picture: 'https://res.cloudinary.com/dftybtoej/image/upload/v1542027237/stock_photo.jpg', admin: true)
u1.save
3.times do
  Recipe.create!(name: Faker::Food.dish, method: Faker::Food.description, photo: 'https://picsum.photos/200/300', user_id: u1.id)
end
u2 = User.new(email: 'p@p.p', password: 'pppppp', username: 'pro', first_name: 'Pethro', last_name: 'Milliams', profile_picture: 'https://res.cloudinary.com/dftybtoej/image/upload/v1542031690/coming_soon.jpg', admin: false)
u2.save
3.times do
  Recipe.create!(name: Faker::Food.dish, method: Faker::Food.description, photo: 'https://picsum.photos/200/300', user_id: u2.id)
end
18.times do
  u3 = User.new(email: Faker::Internet.email, password: Faker::Internet.password, username: Faker::Internet.username, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, profile_picture: 'https://picsum.photos/200/300', admin: false)
  u3.save
  2.times do
    Recipe.create!(name: Faker::Food.dish, method: Faker::Food.description, photo: 'https://picsum.photos/200/300', user_id: u3.id)
  end
end

users = User.all
recipes = Recipe.all

puts "Generating reviews..."
50.times do
  Review.create!(body: Faker::GreekPhilosophers.quote, user_id: users.sample.id, recipe_id: recipes.sample.id)
end

puts "Generating user ratings..."
100.times do
  UserRating.create!(score: rand(1..5), user_id: users.sample.id, recipe_id: recipes.sample.id)
end

puts "Finished seeding"
