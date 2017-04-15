class CreateProjects < ActiveRecord::Migration[5.0]
  def up
    create_table :projects do |t|
      t.integer :thesis_id
      t.integer :student_id
      t.string :summary
      t.boolean :visibility, :null => false
      t.boolean :editability, :null => false
      t.timestamps
    end
    add_index("projects", ['thesis_id', 'student_id'])
  end

  def down
    drop_table :projects
  end
end
