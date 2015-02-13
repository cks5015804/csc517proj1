class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :description
      t.integer :pointVal
      t.string :stage

      t.integer :project_id

      t.timestamps

    end
  end
end
