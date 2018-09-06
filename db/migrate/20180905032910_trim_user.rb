class TrimUser < ActiveRecord::Migration[5.2]
  def down
    remove_column :users, :password_hash
  end
end
