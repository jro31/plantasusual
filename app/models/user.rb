class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes
  has_many :reviews
  has_many :favourites
  has_many :user_ratings

  validates :username, presence: true, uniqueness: true, format: { with: /\w{3,16}/, message: "must be 3 to 16 characters, of letters, numbers and underscores only" }
  validates :first_name, presence: false, format: { with: /[a-zA-Z]{2,50}/, message: "must use letters only" }
  validates :last_name, presence: false, format: { with: /[a-zA-Z]{2,50}/, message: "must use letters only" }
end
