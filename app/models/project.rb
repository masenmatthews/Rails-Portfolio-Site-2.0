class Project < ActiveRecord::Base
  belongs_to :user
  validates :project_title, :project_body, :presence => true
end
