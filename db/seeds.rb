# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bucket = Bucket.create!(name: 'test', secret: 'abcdefg')
bucket.images.create!(image_url: 'http://3.bp.blogspot.com/-4kBvHvCJnOY/T-iKBteyTKI/AAAAAAAABLw/CwDU11DBqWc/s1600/kitten.jpeg', name: 'kitten')
bucket.images.create!(image: File.new('./spec/files/hmans.jpg'), name: 'hmans')
