class CreateForumAreas < ActiveRecord::Migration
  def change
    create_table :forum_areas do |t|
      t.string :title

      t.timestamps
    end
  end
end
