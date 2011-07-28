class ForumPost < ActiveRecord::Base
  belongs_to :forum_thread
  belongs_to :user
	validates :content, :user_id, :forum_thread_id, :presence => true
end
