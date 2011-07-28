class GermanGoLeague < ActiveRecord::Base
  mount_uploader :datei, AvatarUploader
	validates :brett, :spieler1, :spieler2,:datum, :presence => true
	validates :brett, :numericality => { :only_integer => true }
end
