# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = 'http://tmdb.lewagon.com/movie/top_rated'
html_content = URI.open(url).read
movies = JSON.parse(html_content)

puts "creating fake everthing..."
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all


movies['results'].each do |movie|
  Movie.create(title: movie["title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/w500/#{movie['poster_path']}", rating: movie["vote_average"])
end



List.create(name: "Classic")
List.create(name: "Superhero")


Bookmark.create(comment: "I like this movie love love!", movie: Movie.first, list: List.first)
Bookmark.create(comment: "I m not interested in it!", movie: Movie.last, list: List.last)
puts "finish"
