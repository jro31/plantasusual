class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes
  has_many :comments
  has_many :favourites
  has_one :profile

  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  # validates :first_name, presence: false, format: { with: /[a-zA-Z]{2,50}/, message: "must use letters only" }
  # validates :last_name, presence: false, format: { with: /[a-zA-Z]{2,50}/, message: "must use letters only" }

  mount_uploader :profile_picture, PhotoUploader
end
