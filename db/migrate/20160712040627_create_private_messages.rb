class CreatePrivateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :private_messages do |t|
      t.text :body
      t.references :conversation, foreign_key: true
      t.references :user, foreign_key: true
      t.string :from_user

      t.timestamps
    end
  end
end
