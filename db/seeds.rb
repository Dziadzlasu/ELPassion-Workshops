# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Download json with movies data
movies_json_url = URI('https://raw.githubusercontent.com/mlabouardy/Rated-Movies/master/client/data/top-rated.json')
movies_json = Net::HTTP.get(movies_json_url)
movies = JSON.parse(movies_json)['movies']

# Delete each movie from database
Movie.delete_all

# Iterate through each of movie
movies.take(200).each do |movie|
  # Extract data about movie
  cover_url = movie['img']
  rating = movie['rating'].to_i
  title = movie['title']
  year = movie['year'].to_i
  tags = movie['tags'].map {|tag| tag['name']}
  description = movie['description']


  # Here you can use variables
  created_movie = Movie.create!(title: title, description: description, year: year, poster: cover_url)

  Rating.create(value: rand(1..10), movie_id: created_movie.id)
  created_movie.ratings << Rating.create(value: rand(1..10))
  created_movie.ratings << Rating.create(value: rand(1..10))
  created_movie.ratings << Rating.create(value: rand(1..10))
end

puts "Done! "
