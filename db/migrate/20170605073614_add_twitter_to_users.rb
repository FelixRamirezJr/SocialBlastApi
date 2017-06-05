class AddTwitterToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :twitter_user_id, :text, default: ""
    add_column :users, :twitter_token, :text, default: ""
    add_column :users, :twitter_secret, :text, default: ""
    add_column :users, :twitter_username, :text, default: ""
  end
end
