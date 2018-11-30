class AddReferencesToAmounts < ActiveRecord::Migration[5.2]
  def change
    add_reference :amounts, :unit, foreign_key: true
    add_reference :amounts, :preparation_method, foreign_key: true
  end
end
