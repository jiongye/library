# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
User.create! :name => 'Jiongye Li', :email => 'jli@tiananntemple.org', :password => 'dao123', :password_confirmation => 'dao123', :username => 'jiongye'
User.create! :name => 'Admin', :email => 'admin@tiananntemple.org', :password => 'password', :password_confirmation => 'password', :username => 'admin'

