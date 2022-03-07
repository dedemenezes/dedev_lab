require 'pry-byebug'
require "json"
require "open-uri"

puts 'Cleaning DB'

User.destroy_all
Movie.destroy_all

puts "Seeding users"
User.create! email: 'dede@teacher.com', password: 123456, first_name: "Andre", last_name: "Menezes", birth_date: "1988-02-20"

puts User.last.inspect


puts "Seeding movies"
url = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&page=1"
# binding.pry
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)
movies['results'].each do |movie|
  # binding.pry
  movie = Movie.create!(
    title: movie['title'],
    synopsis: movie['overview'],
    rating: movie['vote_average'].to_f * 10,
    original_language: movie['original_language'],
    original_title: movie['original_title'],
    poster_url: "https://image.tmdb.org/t/p/w500/#{movie['poster_path']}",
    backdrop_url: "https://image.tmdb.org/t/p/w500/#{movie['backdrop_path']}",
    release_date: movie['release_date']
  )
end

puts "Finished -> #{Movie.count} movies created"
puts "zo/"
