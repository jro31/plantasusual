class AddDeletedToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :deleted, :boolean, default: false
  end
end
