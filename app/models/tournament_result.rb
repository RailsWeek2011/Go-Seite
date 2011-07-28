class TournamentResult < ActiveRecord::Base
	belongs_to :spieler1, :foreign_key => 'spieler1', :class_name => 'TournamentPlayer'
	belongs_to :spieler2, :foreign_key => 'spieler2', :class_name => 'TournamentPlayer'
end
