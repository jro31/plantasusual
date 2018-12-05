class CreateJoinTableRecipeCategory < ActiveRecord::Migration[5.2]
  def change
    create_join_table :recipes, :categories do |t|
      # t.index [:recipe_id, :category_id]
      # t.index [:category_id, :recipe_id]
    end
  end
end
