class CreateCommentReports < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_reports do |t|
      t.string :report
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
