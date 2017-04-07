class CreateStudents < ActiveRecord::Migration[5.0]
  def up
    create_table :students do |t|
      t.string :first_name, :limit => 50
      t.string :last_name, :limit => 25
      t.string :user_name, :limit => 50
      t.string :email
      t.string :student_number, :limit => 10
      t.string :password, :limit => 32, :null => false

      t.timestamps
    end
  end

  def down
    drop_table :students
  end
end
