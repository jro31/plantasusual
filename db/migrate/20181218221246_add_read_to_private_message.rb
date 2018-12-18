class AddReadToPrivateMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :private_messages, :read, :boolean, default: false
  end
end
