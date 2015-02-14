class CreateUsers < ActiveRecord::Migration
  def change
    drop_table :users
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :role

      t.integer :project_id
      t.integer :story_id

      t.timestamps
    end

  end
end
