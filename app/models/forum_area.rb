class ForumArea < ActiveRecord::Base
  has_many :forum_threads, :dependent => :destroy
end
