class RemoveCollaborations < ActiveRecord::Migration[5.0]
  def up
    drop_table :collaborations
    drop_table :collaborators
    drop_table :collaborated_theses
    remove_index("students", "collaborator_id")
    remove_column("students", "collaborator_id")
  end

  def down
    add_column("students", "collaborator_id")
    add_index("students", "collaborator_id")

    create_table :collaborated_theses do |t|

      t.timestamps
    end

    create_table :collaborators do |t|
      t.integer "collaborated_theses_id"
      t.timestamps
    end

    create_table :collaborations do |t|
      t.timestamps
    end
  end

end
