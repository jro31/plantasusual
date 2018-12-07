class RecipeReport < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates :report, presence: true, length: { minimum: 8 }
end
