class CreateJoinTableRecipeEquipment < ActiveRecord::Migration[5.2]
  def change
    create_join_table :recipes, :equipment do |t|
      # t.index [:recipe_id, :equipment_id]
      # t.index [:equipment_id, :recipe_id]
    end
  end
end
