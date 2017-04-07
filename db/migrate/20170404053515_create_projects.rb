class CreateProjects < ActiveRecord::Migration[5.0]
  def up
    create_table :projects do |t|
      t.boolean :visibility, :null => false
      t.boolean :editability, :null => false

      t.timestamps
    end
  end

  def down
    drop_table :projects
  end
end
