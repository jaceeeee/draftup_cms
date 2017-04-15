class CleanUpProjects < ActiveRecord::Migration[5.0]

  def up
    remove_column "projects", "visibility"
    remove_column "projects", "editability"
  end

  def down
    add_column "projects", "editability", :boolean, :null => false
    add_column "projects", "visibility", :boolean, :null => false
  end
end
