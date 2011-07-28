class TournamentPlayer < ActiveRecord::Base
	validates :name, :vorname, :email,:rank, :presence => true
end
