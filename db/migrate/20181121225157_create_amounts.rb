class CreateAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :amounts do |t|
      t.references :ingredient, foreign_key: true
      t.references :recipe, foreign_key: true
      t.integer :size
      t.string :unit
      t.string :preparation
      t.boolean :optional, default: false

      t.timestamps
    end
  end
end
