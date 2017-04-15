class CreateCollaborators < ActiveRecord::Migration[5.0]
  def up
    create_table :collaborators do |t|

      t.timestamps
    end
  end

  def down
    drop_table :collaborators
  end
end
