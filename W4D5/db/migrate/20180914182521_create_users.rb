class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.index :username, unique: true

      t.string :password_digest, null: false

      t.string :session_token, null: false
      t.index :session_token

      t.timestamps
    end
  end
end
