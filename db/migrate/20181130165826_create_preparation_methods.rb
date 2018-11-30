class CreatePreparationMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :preparation_methods do |t|
      t.string :name

      t.timestamps
    end
  end
end
