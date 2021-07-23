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

puts "creating fake movie..."
movies['results'].each do |movie|
  Movie.create(title: movie["title"], overview: movie["overview"], poster_url: "https://images.unsplash.com/photo-1624313603844-dda78ecf39b8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=901&q=80.png", rating: movie["vote_average"])
end
puts "finish"

List.destroy_all
List.create(name: "Classic")
List.create(name: "Superhero")

Bookmark.create(comment: "I like this movie love love!", movie: Movie.first, list: List.first)
Bookmark.create(comment: "I m not interested in it!", movie: Movie.last, list: List.last)
