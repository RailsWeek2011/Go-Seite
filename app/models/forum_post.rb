class ForumPost < ActiveRecord::Base
  belongs_to :forum_thread
end
