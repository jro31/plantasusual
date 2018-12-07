class CommentReport < ApplicationRecord
  belongs_to :comment
  belongs_to :user

  validates :report, presence: true, length: { minimum: 8 }
end
