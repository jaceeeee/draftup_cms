class AddPasswordDigestToStudents < ActiveRecord::Migration[5.0]
  def up
    remove_column "students", "password"
    add_column "students", "password_digest", :string
  end

  def down
    remove_column "students", "password_digest"
    add_column "students", "password", :string, :limit => 40
  end
end
