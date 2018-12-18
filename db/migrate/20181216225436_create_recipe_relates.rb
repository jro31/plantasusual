class CreateRecipeRelates < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_relates do |t|
      t.integer :relater_id
      t.integer :relatee_id

      t.timestamps
    end
  end
end
