# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
b = Bachelorette.create([{ name: 'Sherry', age: 24, season_id: 1}])
b1 = Bachelorette.create([{ name: 'Michelle', age: 26, season_id: 2}])
b2 = Bachelorette.create([{ name: 'Carly', age: 23, season_id: 3}])

s = Suitor.create([{ name: 'Mark', age: '42', bachelorette_id: 1}])
s = Suitor.create([{ name: 'Mike', age: '42', bachelorette_id: 1}])
s = Suitor.create([{ name: 'Tom', age: '42', bachelorette_id: 2}])
s = Suitor.create([{ name: 'Billy', age: '42', bachelorette_id: 2}])
s = Suitor.create([{ name: 'Doug', age: '42', bachelorette_id: 3}])
s = Suitor.create([{ name: 'Chris', age: '42', bachelorette_id: 3}])
s = Suitor.create([{ name: 'Matt', age: '42', bachelorette_id: 3}])
s = Suitor.create([{ name: 'Gray', age: '42', bachelorette_id: 2}])
s = Suitor.create([{ name: 'Eric', age: '42', bachelorette_id: 2}])
