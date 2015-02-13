class User < ActiveRecord::Base

  USER_ROLES = %w[Admin Dev]

  # users can only belong to one project at a time
  # users can only be signed up for one story at a time
  belongs_to :project, inverse_of: :users, :class_name => "Project", :foreign_key => "project_id"
  belongs_to :story, inverse_of: :users, :class_name => "Story", :foreign_key => "story_id"

  validates :name, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true
  validates :role, :presence => true

  def authenticate(email, password)
    if user = User.find_by_email(email)
      if user.password == password
      #if user.password == ''
          return user
      end
    end
    return nil
  end

end
