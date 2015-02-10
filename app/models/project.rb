class Project < ActiveRecord::Base

  # many users can be on the same project
  has_many :user

  validates :title, :presence => true
  validates :description, :presence => true

end
