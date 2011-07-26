class CreateTournamentResults < ActiveRecord::Migration
  def change
    create_table :tournament_results do |t|
      t.integer :spieler1
      t.integer :spieler2
      t.integer :ergebnis
      t.integer :runde

      t.timestamps
    end
  end
end
