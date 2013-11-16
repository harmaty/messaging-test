class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :recipient_id
      t.integer :sender_id
      t.boolean :is_read, default: false

      t.timestamps
    end
  end
end
