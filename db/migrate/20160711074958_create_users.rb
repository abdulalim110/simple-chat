class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :session_token
      t.string :slug

      t.timestamps
    end
  end
end
