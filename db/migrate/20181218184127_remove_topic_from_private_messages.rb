class RemoveTopicFromPrivateMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :private_messages, :topic, :string
  end
end
