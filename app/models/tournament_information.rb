class TournamentInformation < ActiveRecord::Base
	validates :anfahrt, :ausschreibung, :kontakt, :presence => true
end
