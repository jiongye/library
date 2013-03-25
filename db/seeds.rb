# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'create roles'
admin_role = Role.create! :name => 'admin'
Role.create! :name => 'librarian'
Role.create! :name => 'borrower'

puts 'SETTING UP DEFAULT USER LOGIN'
User.create! :name => 'Admin', :email => 'admin@tiananntemple.org', :password => 'password', :password_confirmation => 'password', :username => 'admin', :role_id => admin_role.id


