# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bucket = Bucket.create!(name: 'Test')
bucket.images.create! do |image|
  image.image_url = 'http://placekitten.com/g/500/500'
  image.name = 'kitten'
end
