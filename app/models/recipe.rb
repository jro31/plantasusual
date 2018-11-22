class Recipe < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :ingredients, through: :amounts
  has_many :equipments, through: :recipe_equipments
  has_many :user_ratings, dependent: :destroy
  has_many :favourites
end
