class AddIndexesOnMessages < ActiveRecord::Migration
  def change
    add_index :messages, :recipient_id
    add_index :messages, :sender_id
    add_index :users, :name
  end
end
