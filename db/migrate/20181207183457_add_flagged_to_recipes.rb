class AddFlaggedToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :flagged, :boolean, default: false
  end
end
