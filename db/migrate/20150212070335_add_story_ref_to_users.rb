class AddStoryRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :story, index: true
  end
end
