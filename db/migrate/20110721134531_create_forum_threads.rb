class CreateForumThreads < ActiveRecord::Migration
  def change
    create_table :forum_threads do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :forum_area_id

      t.timestamps
    end
  end
end
