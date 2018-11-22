class AddDetailsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :servings, :integer
    add_column :recipes, :cooking_time, :integer
  end
end
