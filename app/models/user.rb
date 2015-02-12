class User < ActiveRecord::Base

  # users can only belong to one project at a time
  # users can only be signed up for one story at a time
  belongs_to :project, :class_name => "Project", :foreign_key => "project_id"
  belongs_to :story, :class_name => "Story", :foreign_key => "story_id"

  validates :email, :presence => true
  validates :password, :presence => true
  validates :role, :presence => true

  def authenticate(email, password)
    if user = User.find_by_email(email)
        if user.password == password
          return user
      end
    end
    return nil
  end

end
