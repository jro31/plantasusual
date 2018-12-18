class RecipeRelate < ApplicationRecord
  belongs_to :relater, foreign_key: "relater_id", class_name: "Recipe"
  belongs_to :relatee, foreign_key: "relatee_id", class_name: "Recipe"

  validates :relater, uniqueness: { scope: :relatee }
end
