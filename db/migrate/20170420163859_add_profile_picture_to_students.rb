class AddProfilePictureToStudents < ActiveRecord::Migration[5.0]
  def up
    add_column "students", "profile_pic", :string
  end

  def down
    remove_column "students", "profile_pic"
  end
end
