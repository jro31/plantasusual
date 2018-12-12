puts "Generating equipment..."
equipment_array = ['Blender', 'Food processor', 'Oven', 'Stove', 'Skillet', 'Baking dish', 'Grill', 'Mixing bowl', 'Muffin tray', 'Cake tin', 'Saucepan', 'Baking tray']
equipment_array.each do |e|
  unless Equipment.where(name: e.capitalize).exists?
    Equipment.create!(name: e.capitalize)
  end
end

puts "Generating categories..."
categories_array = ['Dessert', 'Healthy', 'Breakfast', 'Gluten-free', 'Grain', 'Smoothie', 'Main', 'Side', 'Condiment', 'Salad', 'Soup', 'Sandwich', 'Fast food', 'Snack', 'Paleo', 'Stew', 'Pasta', 'Curry', 'Baked', 'High-protein', 'Dip', 'Pizza']
categories_array.each do |c|
  unless Category.where(name: c.capitalize).exists?
    Category.create!(name: c.capitalize)
  end
end

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

puts "Finished seeding"
