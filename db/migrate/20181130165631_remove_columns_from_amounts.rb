class RemoveColumnsFromAmounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :amounts, :preparation, :string
    remove_column :amounts, :unit, :string
  end
end
