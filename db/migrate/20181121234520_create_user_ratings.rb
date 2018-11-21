class CreateUserRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_ratings do |t|
      t.integer :score, null: false
      t.references :user, foreign_key: true
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
