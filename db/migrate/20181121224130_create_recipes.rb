class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :photo
      t.string :method, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
