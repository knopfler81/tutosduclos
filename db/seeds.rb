# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



rails4 = Category.new(name: "Rails 4")
rails4.save

rails5 = Category.new(name: "Rails 5")
rails5.save

heroku = Category.new(name: "Heroku")
heroku.save

aws = Category.new(name: "AWS-Amazon")
aws.save

shell= Category.new(name: "Console/Shell")
shell.save

ruby= Category.new(name: "Ruby")
ruby.save
