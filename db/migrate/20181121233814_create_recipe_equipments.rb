class CreateRecipeEquipments < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_equipments do |t|
      t.references :recipe, foreign_key: true
      t.references :equipment, foreign_key: true

      t.timestamps
    end
  end
end
