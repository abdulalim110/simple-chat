class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :first_user_id
      t.integer :second_user_id

      t.timestamps
    end
  end
end
