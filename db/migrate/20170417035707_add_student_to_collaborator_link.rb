class AddStudentToCollaboratorLink < ActiveRecord::Migration[5.0]
  def up
    add_column "students", "collaborator_id", :string
    add_index("students","collaborator_id")
  end

  def down
    remove_index("students", "collaborator_id")
    remove_column "students", "collaborator_id"
  end
end
