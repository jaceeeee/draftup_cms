class CreateCollaborations < ActiveRecord::Migration[5.0]
  def change
    create_table :collaborations do |t|
      t.string :team_name
      t.string :purpose
      t.integer :member_limit

      t.timestamps
    end
  end
end
