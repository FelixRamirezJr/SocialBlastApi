class AddFacebookidToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fb_user_id, :text, default: ""
  end
end
