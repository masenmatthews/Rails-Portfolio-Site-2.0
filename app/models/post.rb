class Post < ActiveRecord::Base
  belongs_to :user
  validates :post_title, :post_body, :presence => true
end
