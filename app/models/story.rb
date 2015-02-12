class Story < ActiveRecord::Base

  STAGE_OPTIONS = {'Analysis' => 1, 'Ready For Dev' => 2, 'In Dev' => 3,
                    'Dev Complete' => 4, 'In Test' => 5, 'Complete' => 6}

  # categories are part of a project
  belongs_to :project

  # categories can have 0~2 users working on them
  has_many :user

  validates :title, :presence => true
  validates :description, :presence => true
  validates :pointVal, :presence => true
  validates :stage, :presence => true

end
