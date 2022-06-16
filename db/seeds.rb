require "json"
require "open-uri"
require 'faker'

puts 'Cleaning DB'

Assignment.destroy_all
User.destroy_all
# Movie.destroy_all
# TvShow.destroy_all

puts "Seeding users"
User.create!(
  email: 'dede@teacher.com',
  password: 123456,
  first_name: "Andre",
  last_name: "Menezes",
  birth_date: "1988-02-20",
  nickname: 'dedemenezes'
)
2.times do
  Task.create!(
    name: "Buy #{Faker::Game.platform}",
    manager: User.last,
    expected_end_date: Date.today + (1..30).to_a.sample,
    capacity: 1
  )
end
User.create!(
  email: 'carla@teacher.com',
  password: 123456,
  first_name: "Carla",
  last_name: "Valdivia",
  birth_date: "1988-02-20",
  nickname: 'cvaldivia83'
)
3.times do
  Task.create!(
    name: "Travel to #{Faker::Movies::StarWars.planet}",
    manager: User.last,
    expected_end_date: Date.today + (365..789).to_a.sample,
    capacity: 4
  )
end
User.create!(
  email: 'belisabettega@teacher.com',
  password: 123456,
  first_name: "Belisa",
  last_name: "Bettega",
  birth_date: "1988-02-20",
  nickname: 'belisabettega'
)
3.times do |t|
  Task.create!(
    name: "Finish #{t + 1}",
    manager: User.last,
    expected_end_date: Date.today + (30..90).to_a.sample,
    capacity: 3
  )
end
User.create!(
  email: 'pessanhadavi@teacher.com',
  password: 123456,
  first_name: "David",
  last_name: "Pessanha",
  birth_date: "1988-02-20",
  nickname: 'pessanhadavi'
)
3.times do |t|
  Task.create!(
    name: "Start #{t + 1}",
    manager: User.last,
    expected_end_date: Date.today + (1..30).to_a.sample,
    capacity: 2
  )
end
puts User.last.inspect



# puts "Seeding movies"
# url = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&page=1"
# # binding.pry
# movies_serialized = URI.open(url).read
# movies = JSON.parse(movies_serialized)
# movies['results'].each do |movie|
#   # binding.pry
#   movie = Movie.create!(
#     title: movie['title'],
#     synopsis: movie['overview'],
#     rating: movie['vote_average'].to_f * 10,
#     original_language: movie['original_language'],
#     original_title: movie['original_title'],
#     poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
#     backdrop_url: "https://image.tmdb.org/t/p/w500#{movie['backdrop_path']}",
#     release_date: movie['release_date']
#   )
# end

# puts "Seeding TvShows"
# series_url = "https://api.themoviedb.org/3/tv/popular?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&page=1"
# # binding.pry
# tv_shows_serialized = URI.open(series_url).read
# tv_shows = JSON.parse(tv_shows_serialized)
# tv_shows['results'].each do |tv_show|
#   # binding.pry
#   tv_show = TvShow.create!(
#     title: tv_show['name'],
#     synopsis: tv_show['overview'],
#     rating: tv_show['vote_average'].to_f * 10,
#     original_language: tv_show['original_language'],
#     original_title: tv_show['original_name'],
#     poster_url: "https://image.tmdb.org/t/p/w500#{tv_show['poster_path']}",
#     backdrop_url: "https://image.tmdb.org/t/p/w500#{tv_show['backdrop_path']}",
#     release_date: tv_show['first_air_date']
#   )
# end

# puts "Finished -> #{TvShow.count} tv_shows created"

puts "zo/"
