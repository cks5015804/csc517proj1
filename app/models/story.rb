class Story < ActiveRecord::Base

  STAGE_OPTIONS = {'Analysis' => 1, 'Ready For Dev' => 2, 'In Dev' => 3,
                    'Dev Complete' => 4, 'In Test' => 5, 'Complete' => 6}

  # a story can belong to only 1 project
  belongs_to :project, inverse_of: :stories, :class_name => "Project", :foreign_key => "project_id"

  # a story can have 0~2 users working on them
  has_many :users, inverse_of: :story, dependent: :nullify

  validates :title, :presence => true
  validates :description, :presence => true
  validates :pointVal, :presence => true
  validates :stage, :presence => true

end
