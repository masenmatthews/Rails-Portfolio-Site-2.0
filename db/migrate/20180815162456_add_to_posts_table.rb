class AddToPostsTable < ActiveRecord::Migration[5.2]
  def self.up
    change_table :posts do |t|
      t.column :user_id, :integer
      t.column :post_title, :string
      t.column :post_body, :string

    end
  end
end
