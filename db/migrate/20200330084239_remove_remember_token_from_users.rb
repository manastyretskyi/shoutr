class RemoveRememberTokenFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :remember_token
    remove_column :users, :remember_token
  end
end
