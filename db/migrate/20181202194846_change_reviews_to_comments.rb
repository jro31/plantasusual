class ChangeReviewsToComments < ActiveRecord::Migration[5.2]
  def change
    rename_table :reviews, :comments
  end
end
