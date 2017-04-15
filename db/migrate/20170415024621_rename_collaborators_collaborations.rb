class RenameCollaboratorsCollaborations < ActiveRecord::Migration[5.0]
  def up
    add_column "collaborations", "team_name", :string
  end

  def down
    remove_column "collaborations", "team_name"
  end
end
