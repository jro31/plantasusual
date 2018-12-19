class User < ApplicationRecord
  after_create :create_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes
  has_many :comments
  has_many :favourites
  has_many :recipe_reports
  has_many :comment_reports
  has_one :profile

  has_many :senders, through: :sender_private_messages, source: :sender
  has_many :sender_private_messages, foreign_key: :receiver_id, class_name: "PrivateMessage"
  has_many :receivers, through: :receiver_private_messages, source: :receiver
  has_many :receiver_private_messages, foreign_key: :sender_id, class_name: "PrivateMessage"

  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  # validates :first_name, presence: false, format: { with: /[a-zA-Z]{2,50}/, message: "must use letters only" }
  # validates :last_name, presence: false, format: { with: /[a-zA-Z]{2,50}/, message: "must use letters only" }

  mount_uploader :profile_picture, PhotoUploader

  private

  def create_profile
    Profile.create(user_id: self.id)
  end
end
