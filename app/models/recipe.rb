class Recipe < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :ingredients, through: :amounts
  has_many :equipments, through: :recipe_equipments
  has_many :user_ratings
  has_many :favourites
end
