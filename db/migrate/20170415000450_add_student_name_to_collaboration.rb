class AddStudentNameToCollaboration < ActiveRecord::Migration[5.0]
  def up
    add_column "collaborations", "student_name", :string
  end

  def down
    remove_column "collaborations", "student_name"
  end
end
