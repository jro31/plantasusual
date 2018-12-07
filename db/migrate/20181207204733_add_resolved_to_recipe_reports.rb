class AddResolvedToRecipeReports < ActiveRecord::Migration[5.2]
  def change
    add_column :recipe_reports, :resolved, :boolean, default: false
  end
end
