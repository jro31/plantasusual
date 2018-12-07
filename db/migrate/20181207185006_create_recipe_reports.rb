class CreateRecipeReports < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_reports do |t|
      t.string :report
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
