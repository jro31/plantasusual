class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  has_many :comment_reports

  validates :body, presence: true, length: { minimum: 3 }
end
