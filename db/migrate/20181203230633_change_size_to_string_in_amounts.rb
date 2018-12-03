class ChangeSizeToStringInAmounts < ActiveRecord::Migration[5.2]
  def change
    change_column :amounts, :size, :string
  end
end
