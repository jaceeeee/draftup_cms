class CreatePosts < ActiveRecord::Migration[5.0]
  def up
    create_table :posts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end

# rails db:migrate:up VERSION=<number>
# rails db:migrate:down VERSION=<number>
# rails db:migrate:redo VERSION=<number>
# rails db:migrate VERSION=0 (to the beginning)
