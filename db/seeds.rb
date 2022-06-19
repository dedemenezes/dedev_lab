require "json"
require "open-uri"
require 'faker'

puts 'Cleaning DB'

Assignment.destroy_all
Task.destroy_all
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
User.create!(
  email: 'carla@teacher.com',
  password: 123456,
  first_name: "Carla",
  last_name: "Valdivia",
  birth_date: "1988-02-20",
  nickname: 'cvaldivia83'
)
User.create!(
  email: 'belisabettega@teacher.com',
  password: 123456,
  first_name: "Belisa",
  last_name: "Bettega",
  birth_date: "1988-02-20",
  nickname: 'belisabettega'
)
User.create!(
  email: 'pessanhadavi@teacher.com',
  password: 123456,
  first_name: "David",
  last_name: "Pessanha",
  birth_date: "1988-02-20",
  nickname: 'pessanhadavi'
)
4.times do |n|
  rand(5..10).times do |n_two|
    Task.create!(
      name: "task #{n_two + 1}",
      manager: User.find(n + 1),
      expected_end_date: Date.today + (1..30).to_a.sample,
      capacity: rand(1..4)
    )
    rand(10..15).times do |number|
      ChecklistItem.create! content: "TODO: item #{number}", task: Task.last, completed: [true, false].sample
    end


  end
  ChecklistItem.last.update(completed: true)
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
