class AddFbinfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fb_name, :text, default: ""
    add_column :users, :fb_email, :text, default: ""
  end
end
