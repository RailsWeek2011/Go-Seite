class ForumThread < ActiveRecord::Base
  has_many :forum_posts
  belongs_to :forum_area
end
