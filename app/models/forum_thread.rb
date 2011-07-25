class ForumThread < ActiveRecord::Base
  belongs_to :forum_area
  has_many :forum_posts
end
