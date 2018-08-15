class CreateUsers < ActiveRecord::Migration[5.2]
  def change
      create_table :users do |t|
        t.column :username, :string
        t.column :admin, :boolean, :default => false
        t.column :password_hash, :string
        t.column :password_salt, :string
    end

    def up
      add_attachment :users, :avatar
    end
  end
end
