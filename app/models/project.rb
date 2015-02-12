class Project < ActiveRecord::Base

  # a project can have many stories
  has_many :stories, inverse_of: :project, dependent: :destroy

  # many users can be on the same project
  has_many :users, inverse_of: :project, dependent: :nullify


  validates :title, :presence => true
  validates :description, :presence => true

end
