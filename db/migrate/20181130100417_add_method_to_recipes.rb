class AddMethodToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :method, :string
  end
end
