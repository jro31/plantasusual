class CreateFavourites < ActiveRecord::Migration[5.2]
  def change
    create_table :favourites do |t|
      t.references :user, foreign_key: true
      t.references :recipe, foreign_key: true
      t.boolean :star, null: false, default: true

      t.timestamps
    end
  end
end
