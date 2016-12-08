class AddClientToSessionTokens < ActiveRecord::Migration
  def change
    add_column :session_tokens, :client, :string
  end
end
