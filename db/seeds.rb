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
