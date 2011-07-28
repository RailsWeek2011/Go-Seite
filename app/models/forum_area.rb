class ForumArea < ActiveRecord::Base
  has_many :forum_threads, :dependent => :destroy
	validates :title, :presence => true
end
