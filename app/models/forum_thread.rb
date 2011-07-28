class ForumThread < ActiveRecord::Base
  belongs_to :forum_area
	belongs_to :user
  has_many :forum_posts, :dependent => :destroy
end
