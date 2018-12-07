class AddUserToCommentReports < ActiveRecord::Migration[5.2]
  def change
    add_reference :comment_reports, :user, foreign_key: true
  end
end
