class AddResolvedToCommentReports < ActiveRecord::Migration[5.2]
  def change
    add_column :comment_reports, :resolved, :boolean, default: false
  end
end
