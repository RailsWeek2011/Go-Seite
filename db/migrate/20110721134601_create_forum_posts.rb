class CreateForumPosts < ActiveRecord::Migration
  def change
    create_table :forum_posts do |t|
      t.text :content
      t.integer :user_id
      t.integer :forum_thread_id

      t.timestamps
    end
  end
end
