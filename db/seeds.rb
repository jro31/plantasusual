puts "Deleting recipes..."
Recipe.destroy_all

puts "Deleting users..."
User.destroy_all

puts "Generating recipes..."
20.times do
  Recipe.create()
end
