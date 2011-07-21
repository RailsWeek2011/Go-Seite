class AddCharacteristicsToUser < ActiveRecord::Migration
  def change
    add_column :users, :Name, :string
    add_column :users, :Vorname, :string
    add_column :users, :Rang, :string
    add_column :users, :Club, :string
    add_column :users, :Land, :string
    add_column :users, :DGoB, :boolean
    add_column :users, :studi, :boolean
  end
end
