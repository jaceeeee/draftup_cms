class ChangeThesisTable < ActiveRecord::Migration[5.0]
  def up
    add_column "theses", "attachment", :string
  end

  def down
    remove_column "theses", "attachment"
  end
end
