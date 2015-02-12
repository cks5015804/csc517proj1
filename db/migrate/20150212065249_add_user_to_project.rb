class AddUserToProject < ActiveRecord::Migration
  def change
    add_reference :users, :project, index: true
  end
end
