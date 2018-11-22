puts "Deleting recipes..."
Recipe.destroy_all

puts "Deleting users..."
User.destroy_all

puts "Deleting equipment..."
Equipment.destroy_all

puts "Deleting ingredients..."
Ingredient.destroy_all

puts "Generating equipment..."
20.times do
  Equipment.create(name: Faker::Appliance.equipment)
end

puts "Generating ingredients..."
50.times do
  Ingredient.create(name: Faker::Food.ingredient)
end

puts "Generating recipes..."
20.times do
  Recipe.create()
end
