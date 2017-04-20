class CreateStudentsCollaborationsJoin < ActiveRecord::Migration[5.0]
  def up
    create_table :collaborations_students, :id => false do |t|
      t.integer "student_id"
      t.integer "collaboration_id"
    end
    add_index("collaborations_students", ["student_id", "collaboration_id"])
  end

  def down
    drop_table :collaborations_students
  end
end
