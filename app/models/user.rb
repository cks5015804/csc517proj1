class User < ActiveRecord::Base

  # users can only belong to one project at a time
  # users can only be signed up for one story at a time
  belongs_to :project
  belongs_to :story

  validates :email, :presence => true
  validates :password, :presence => true
  validates :role, :presence => true

end
