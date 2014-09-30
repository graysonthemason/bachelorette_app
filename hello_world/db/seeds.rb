# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all

p1 = Product.create(name: 'Face Cream', description: 'cream for face', price: 7.99)
p2 = Product.create(name: 'Hand Cream', description: 'cream for hand', price: 3.99)
p3 = Product.create(name: 'Cream Cream', description: 'cream for cream', price: 19.99)