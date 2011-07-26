class CreateGermanGoLeagues < ActiveRecord::Migration
  def change
    create_table :german_go_leagues do |t|
      t.integer :brett
      t.string :spieler1
      t.string :spieler2
      t.datetime :datum
      t.avatar :datei

      t.timestamps
    end
  end
end
