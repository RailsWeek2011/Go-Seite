class CreateTournamentInformations < ActiveRecord::Migration
  def change
    create_table :tournament_informations do |t|
      t.text :anfahrt
      t.text :teilnehmerbedingung
      t.text :kontakt
      t.datetime :voranmeldung

      t.timestamps
    end
  end
end
