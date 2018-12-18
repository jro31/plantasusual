class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :amounts, dependent: :destroy
  has_many :ingredients, through: :amounts
  has_many :favourites, dependent: :destroy
  has_many :recipe_reports
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :equipment

  has_many :relaters, through: :relate_relaters, source: :relater
  has_many :relate_relaters, foreign_key: :relatee_id, class_name: "RecipeRelate"
  has_many :relatees, through: :relate_relatees, source: :relatee
  has_many :relate_relatees, foreign_key: :relater_id, class_name: "RecipeRelate"

  validates :name, presence: true, length: { minimum: 3 }

  mount_uploader :photo, PhotoUploader

  def mark_as_deleted!
    update_attribute :deleted, true
  end
end
