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
Company.find_or_create_by_name :name => "Test Customer 2"
# Can be one of http(s)://some/url
# OR
# /local/file/path
Upload.create(:name => "Test Upload",
:file_location => "http://aospx.googlecode.com/files/aospX-1.0.0-BR7-DHD.zip",
:company_id => Company.all.first
)
Upload.find_or_create_by_name(:name => "Test Upload for test customer 2",
:file_location => "http://aospx.googlecode.com/files/aospX-1.0.0-BR7-DHD.zip",
:company_id => Company.all.last
)
puts 'ROLES'
YAML.load_file("#{Rails.root}/config/roles.yml").each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
admin_username = "admin"
admin_email = "memikequinn@gmail.com"
admin_password = "password"
test_username = "testuser1"
test_email = "testuser1@none.com"
test_password = "password"
user = User.find_or_create_by_email( :name => admin_username.dup,
:email => admin_email.dup,
:password => admin_password.dup,
:password_confirmation => admin_password.dup,
:company_id => Company.all.first)
puts 'user: ' << user.name
user.add_role :admin
user.save!
puts "Creating test Device"
test_user = User.find_or_create_by_email( :name => test_username.dup,
:email => test_email.dup,
:password => test_password.dup,
:password_confirmation => test_password.dup,
:company_id => Company.all.last)
test_user.add_role :device_admin
Device.find_or_create_by_name( :name => "Test Device",
:function => "Testing",
:company_id => Company.all.first)

