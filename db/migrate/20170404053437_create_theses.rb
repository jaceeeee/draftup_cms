class CreateTheses < ActiveRecord::Migration[5.0]
  def up
    create_table :theses do |t|
      t.string :title, :limit => 20

      t.timestamps
    end
  end

  def down
    drop_table :theses
  end
end
