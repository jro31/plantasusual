class AddColumnsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :categories_added, :boolean, default: false
    add_column :recipes, :equipment_added, :boolean, default: false
  end
end
