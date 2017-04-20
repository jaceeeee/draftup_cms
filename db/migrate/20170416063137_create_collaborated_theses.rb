class CreateCollaboratedTheses < ActiveRecord::Migration[5.0]
  def up
    create_table :collaborated_theses do |t|

      t.timestamps
    end
  end

  def down
    drop_table :collaborated_theses
  end
end
