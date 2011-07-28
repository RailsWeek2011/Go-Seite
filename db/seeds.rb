# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.new({:Name => "admin", :email => "admin@admin.com", :password => "123456", :password_confirmation => "123456", :roles_mask => "1"}).save
p = User.last
p.roles= %w[admin]
p.save

User.new({:Name => "u1", :email => "u1@user.com", :password => "123456", :password_confirmation => "123456"}).save
User.new({:Name => "u2", :email => "u2@user.com", :password => "123456", :password_confirmation => "123456"}).save
User.new({:Name => "u3", :email => "u3@user.com", :password => "123456", :password_confirmation => "123456"}).save
User.new({:Name => "u4", :email => "u4@user.com", :password => "123456", :password_confirmation => "123456"}).save
User.new({:Name => "u5", :email => "u5@user.com", :password => "123456", :password_confirmation => "123456"}).save
User.new({:Name => "u6", :email => "u6@user.com", :password => "123456", :password_confirmation => "123456"}).save
User.new({:Name => "u7", :email => "u7@user.com", :password => "123456", :password_confirmation => "123456"}).save
User.new({:Name => "u8", :email => "u8@user.com", :password => "123456", :password_confirmation => "123456"}).save

news = ForumArea.new
news.title = "News"
news.save

news_thread = ForumThread.new
news_thread.title = "Ein Beispielseite"
news_thread.user_id = 1
news_thread.forum_area_id = 1
news_thread.content = "Nur ein Beispiel"
news_thread.save

offtopic = ForumArea.new
offtopic.title = "Offtopic"
offtopic.save

TournamentPlayer.new({:name => "1",:vorname => "Spieler", :email => "test2@user.com",:rank => "19 Kyu"}).save
TournamentPlayer.new({:name => "2",:vorname => "Spieler", :email => "test2@user.com",:rank => "2 Kyu"}).save
TournamentPlayer.new({:name => "3",:vorname => "Spieler", :email => "test2@user.com",:rank => "5 Kyu"}).save
TournamentPlayer.new({:name => "4",:vorname => "Spieler", :email => "test2@user.com",:rank => "5 Dan"}).save
TournamentPlayer.new({:name => "5",:vorname => "Spieler", :email => "test2@user.com",:rank => "1 Dan"}).save
TournamentPlayer.new({:name => "6",:vorname => "Spieler", :email => "test2@user.com",:rank => "1 Kyu"}).save
TournamentPlayer.new({:name => "7",:vorname => "Spieler", :email => "test2@user.com",:rank => "1 Kyu"}).save
TournamentPlayer.new({:name => "8",:vorname => "Spieler", :email => "test2@user.com",:rank => "15 Kyu"}).save
TournamentPlayer.new({:name => "9",:vorname => "Spieler", :email => "test2@user.com",:rank => "17 Kyu"}).save
TournamentPlayer.new({:name => "10",:vorname => "Spieler", :email => "test2@user.com",:rank => "8 Kyu"}).save
TournamentPlayer.new({:name => "11",:vorname => "Spieler", :email => "test2@user.com",:rank => "9 Kyu"}).save
TournamentPlayer.new({:name => "12",:vorname => "Spieler", :email => "test2@user.com",:rank => "2 Dan"}).save
TournamentPlayer.new({:name => "13",:vorname => "Spieler", :email => "test2@user.com",:rank => "2 Kyu"}).save
