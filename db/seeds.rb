# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts "Creating test company"
Company.find_or_create_by_name :name => "Test Customer"

puts 'ROLES'
YAML.load_file("#{Rails.root}/config/roles.yml").each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
admin_username = "admin"
admin_email = "memikequinn@gmail.com"
admin_password = "password"

user = User.find_or_create_by_email :name => admin_username.dup, :email => admin_email.dup, :password => admin_password.dup, :password_confirmation => admin_password.dup
puts 'user: ' << user.name
user.add_role :admin
puts "Creating test Device"
Device.find_or_create_by_name :name => "Test Device", :function => "Testing"

