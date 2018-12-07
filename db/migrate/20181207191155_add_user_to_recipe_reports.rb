class AddUserToRecipeReports < ActiveRecord::Migration[5.2]
  def change
    add_reference :recipe_reports, :user, foreign_key: true
  end
end
