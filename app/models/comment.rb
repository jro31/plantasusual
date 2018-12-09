class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  has_many :comment_reports

  validates :body, presence: true, length: { minimum: 3 }

  def mark_as_deleted!
    update_attribute :deleted, true
  end
end
