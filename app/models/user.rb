class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes
  has_many :reviews
  has_many :favourites
  has_many :user_ratings

  validates :username, presence: true, length: { minimum: 3, maximum: 100 }, uniqueness: true
end
