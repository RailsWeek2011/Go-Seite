class CreateTournamentPlayers < ActiveRecord::Migration
  def change
    create_table :tournament_players do |t|
      t.string :name
      t.string :vorname
      t.string :email
      t.boolean :dgob
      t.boolean :studi
      t.string :rank

      t.timestamps
    end
  end
end
