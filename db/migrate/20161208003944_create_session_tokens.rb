class CreateSessionTokens < ActiveRecord::Migration
  def change
    create_table :session_tokens do |t|
      t.integer :user_id
      t.string :token
      t.timestamps null: false
    end
    add_index :session_tokens, :user_id
    add_index :session_tokens, :token, unique: true
    remove_column :users, :session_token
  end
end
