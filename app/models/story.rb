class Story < ActiveRecord::Base

  # categories are part of a project
  belongs_to :project

  # categories can have many users working on them
  has_many :user

  validates :title, :presence => true
  validates :description, :presence => true
  validates :pointVal, :presence => true
  validates :stage, :presence => true

end
