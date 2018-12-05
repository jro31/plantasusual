class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :amounts, dependent: :destroy
  has_many :ingredients, through: :amounts
  has_many :favourites, dependent: :destroy
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :equipment

  validates :name, presence: true, length: { minimum: 3 }

  mount_uploader :photo, PhotoUploader
end
