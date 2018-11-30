class RemoveMethodFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :method, :string
  end
end
