# puts "Deleting recipes..."
# Recipe.destroy_all

# puts "Deleting equipment..."
# Equipment.destroy_all

# puts "Deleting ingredients..."
# Ingredient.destroy_all

# puts "Deleting categories..."
# Category.destroy_all

# puts "Deleting users..."
# User.destroy_all

# puts "Deleting preparation methods"
# PreparationMethod.destroy_all

# puts "Deleting units"
# Unit.destroy_all


puts "Generating equipment..."
equipment_array = ['Blender', 'Food processor', 'Oven', 'Stove', 'Skillet', 'Baking dish', 'Grill', 'Mixing bowl', 'Muffin tray', 'Cake tin', 'Saucepan', 'Baking tray']
equipment_array.each do |e|
  unless Equipment.where(name: e.capitalize).exists?
    Equipment.create!(name: e.capitalize)
  end
end

# puts "Generating ingredients..."
# 50.times do
#   Ingredient.create(name: Faker::Food.ingredient.downcase)
# end

puts "Generating categories..."
categories_array = ['Dessert', 'Healthy', 'Breakfast', 'Gluten-free', 'Grain', 'Smoothie', 'Main', 'Side', 'Condiment', 'Salad', 'Soup', 'Sandwich', 'Fast food', 'Snack', 'Paleo', 'Stew', 'Pasta', 'Curry', 'Baked', 'High-protein', 'Dip', 'Pizza']
categories_array.each do |c|
  unless Category.where(name: c.capitalize).exists?
    Category.create!(name: c.capitalize)
  end
end

# puts "Generating users and recipes..."
# u1 = User.new(email: 'j@j.j', password: 'jjjjjj', username: 'jro', first_name: 'Jethro', last_name: 'Williams', profile_picture: 'https://res.cloudinary.com/dftybtoej/image/upload/v1542027237/stock_photo.jpg', admin: true)
# u1.save
# 3.times do
#   Recipe.create!(name: Faker::Food.dish, method: Faker::Food.description, photo: 'https://res.cloudinary.com/dftybtoej/image/upload/v1543645966/xwxdflrs0w2wwqjqvtsh.jpg', user_id: u1.id, servings: rand(1...8), cooking_time: (rand(1...24) * 5))
# end
# u2 = User.new(email: 'p@p.p', password: 'pppppp', username: 'pro', first_name: 'Pethro', last_name: 'Milliams', profile_picture: 'https://res.cloudinary.com/dftybtoej/image/upload/v1542031690/coming_soon.jpg', admin: false)
# u2.save
# 3.times do
#   Recipe.create!(name: Faker::Food.dish, method: Faker::Food.description, user_id: u2.id, servings: rand(1...8), cooking_time: (rand(1...24) * 5))
# end
# 18.times do
#   u3 = User.new(email: Faker::Internet.email, password: Faker::Internet.password, username: Faker::Internet.username, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, profile_picture: 'https://picsum.photos/200/300', admin: false)
#   u3.save
#   2.times do
#     Recipe.create!(name: Faker::Food.dish, method: Faker::Food.description, photo: 'https://res.cloudinary.com/dftybtoej/image/upload/v1543645966/xwxdflrs0w2wwqjqvtsh.jpg', user_id: u3.id, servings: rand(1...8), cooking_time: (rand(1...24) * 5))
#   end
# end

puts "Generating preparation methods..."
preparation_methods_array = ['chopped', 'seeded', 'rinsed', 'quartered', 'diced', 'toasted', 'ground', 'shelled', 'soaked', 'dried', 'crushed', 'squeezed', 'drained', 'halved', 'peeled']
preparation_methods_array.each do |pm|
  unless PreparationMethod.where(name: pm.downcase).exists?
    PreparationMethod.create!(name: pm.downcase)
  end
end

puts "Generating units..."
units_array = ['gram', 'millilitre', 'pinch', 'splash', 'teaspoon', 'tablespoon', 'cup', 'dash', 'litre', 'kilogram', 'piece', 'inch', 'centimetre', 'can', 'pack', 'clove', 'whole', 'large', 'medium', 'small', 'leaf']
units_array.each do |u|
  unless Unit.where(measurement: u.downcase).exists?
    Unit.create!(measurement: u.downcase)
  end
end

# users = User.all
# recipes = Recipe.all
# equipments = Equipment.all
# ingredients = Ingredient.all
# categories = Category.all
# preparation_methods = PreparationMethod.all
# units = Unit.all

# puts "Generating comments..."
# 50.times do
#   Comment.create!(body: Faker::GreekPhilosophers.quote, user_id: users.sample.id, recipe_id: recipes.sample.id)
# end

# puts "Generating favourites..."
# 42.times do |n|
#   Favourite.create!(recipe_id: recipes[n].id, user_id: users[rand(0..10)].id)
#   Favourite.create!(recipe_id: recipes[n].id, user_id: users[rand(10...20)].id)
# end

# puts "Generating amounts..."
# 202.times do
#  Amount.create!(ingredient_id: ingredients.sample.id, recipe_id: recipes.sample.id, size: rand(1...100), unit_id: units.sample.id, preparation_method_id: preparation_methods.sample.id, optional: false)
# end
# 50.times do
#   Amount.create!(ingredient_id: ingredients.sample.id, recipe_id: recipes.sample.id, size: rand(1...100), unit_id: units.sample.id, preparation_method_id: preparation_methods.sample.id, optional: true)
# end

# puts "Generating recipe equipment..."
# 50.times do
#   RecipeEquipment.create!(recipe_id: recipes.sample.id, equipment_id: equipments.sample.id)
# end

# puts "Generating recipe categories..."
# 75.times do
#   RecipeCategory.create!(recipe_id: recipes.sample.id, category_id: categories.sample.id)
# end

# puts "Generating profiles"
# users.each do |user|
#   Profile.create!(user_id: user.id)
# end

puts "Finished seeding"
