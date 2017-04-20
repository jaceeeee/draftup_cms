class CreateCollaboration < ActiveRecord::Migration[5.0]
  def up
    create_table :collaborations do |t|
      t.timestamps
    end
    add_column :collaborators, :collaboration_id, :integer
    add_index :collaborators, :collaboration_id
  end

  def down
    remove_column :collaborators, :collaboration_id
    drop_table :collaborations
  end
end
