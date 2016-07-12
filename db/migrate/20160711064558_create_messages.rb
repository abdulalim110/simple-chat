class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :chat
      t.string :from_user

      t.timestamps
    end
  end
end
