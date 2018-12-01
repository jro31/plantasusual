class Recipe < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :amounts, dependent: :destroy
  has_many :ingredients, through: :amounts
  has_many :recipe_equipments, dependent: :destroy
  has_many :equipment, through: :recipe_equipments
  has_many :user_ratings, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :recipe_categories, dependent: :destroy
  has_many :categories, through: :recipe_categories

  validates :name, presence: true, length: { minimum: 3 }

  mount_uploader :photo, PhotoUploader
end
