class Story < ActiveRecord::Base

  STAGE_OPTIONS = {'Analysis' => 'Analysis', 'Ready For Dev' => 'Ready For Dev', 'In Dev' => 'In Dev',
                    'Dev Complete' => 'Dev Complete', 'In Test' => 'In Test', 'Complete' => 'Complete'}

                    # a story can belong to only 1 project
  belongs_to :project, inverse_of: :stories, :class_name => "Project", :foreign_key => "project_id"

  # a story can have 0~2 users working on them
  has_many :users, inverse_of: :story, dependent: :nullify

  validates :title, :presence => true
  validates :description, :presence => true
  validates :pointVal, :presence => true
  validates :stage, :presence => true

end
