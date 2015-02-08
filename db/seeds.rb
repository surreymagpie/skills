# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Passwords for each are "secret" !!
# Joe Bloggs is an admin
users = [{ first_name: "Joe",  last_name: "Bloggs", email: "joe.bloggs@example.com", password: "secret", password_confirmation: "secret", admin: true },
  { first_name: "Jane", last_name: "Smith",  email: "jane.smith@example.com", password: "secret", password_confirmation: "secret" },
  { first_name: "Bill", last_name: "Brown",  email: "bill.brown@example.com", password: "secret", password_confirmation: "secret" }]

users.each do |u|
  user = User.create(u)
  if user.errors.blank?
    puts "***User #{user.first_name} #{user.last_name} created ***"
  else
    puts "User failed to create due to below reasons:"
    user.errors.each do |x, y|
       puts"#{x} #{y}" # x will be the field name and y will be the error on it
    end
  end
end
