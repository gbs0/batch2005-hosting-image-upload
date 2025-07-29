# db/seeds.rb
require "open-uri"

movies_data = [
  {
    title: "The Shawshank Redemption",
    rating: 4.3,
    director_name: "Frank Darabont",
    poster_url: "https://m.media-amazon.com/images/I/51NiGlapXlL._AC_.jpg"
  },
  {
    title: "The Godfather",
    rating: 4.2,
    director_name: "Francis Ford Coppola",
    poster_url: "https://m.media-amazon.com/images/I/41--5w2z6jL._AC_.jpg"
  },
  {
    title: "The Dark Knight",
    rating: 4.0,
    director_name: "Christopher Nolan",
    poster_url: "https://m.media-amazon.com/images/I/51AJH+3OS-L._AC_SY679_.jpg"
  },
  {
    title: "Pulp Fiction",
    rating: 3.9,
    director_name: "Quentin Tarantino",
    poster_url: "https://m.media-amazon.com/images/I/71c05lTE03L._AC_SY679_.jpg"
  },
  {
    title: "Forrest Gump",
    rating: 3.8,
    director_name: "Robert Zemeckis",
    poster_url: "https://m.media-amazon.com/images/I/61+F2Gfyc4L._AC_SY679_.jpg"
  },
  {
    title: "Inception",
    rating: 3.8,
    director_name: "Christopher Nolan",
    poster_url: "https://m.media-amazon.com/images/I/510+2aQDwML._AC_SY679_.jpg"
  },
  {
    title: "Fight Club",
    rating: 3.8,
    director_name: "David Fincher",
    poster_url: "https://m.media-amazon.com/images/I/51v5ZpFyaFL._AC_.jpg"
  },
  {
    title: "The Matrix",
    rating: 3.7,
    director_name: "Lana Wachowski, Lilly Wachowski",
    poster_url: "https://m.media-amazon.com/images/I/51EG732BV3L._AC_.jpg"
  },
  {
    title: "Goodfellas",
    rating: 3.7,
    director_name: "Martin Scorsese",
    poster_url: "https://m.media-amazon.com/images/I/51i1XKO0UAL._AC_.jpg"
  },
  {
    title: "The Lord of the Rings: The Return of the King",
    rating: 3.9,
    director_name: "Peter Jackson",
    poster_url: "https://m.media-amazon.com/images/I/51Qvs9i5a%2BL._AC_.jpg"
  },
  {
    title: "Star Wars: Episode V - The Empire Strikes Back",
    rating: 3.7,
    director_name: "Irvin Kershner",
    poster_url: "https://m.media-amazon.com/images/I/51K8ouYrHeL._AC_SY679_.jpg"
  },
  {
    title: "Interstellar",
    rating: 3.6,
    director_name: "Christopher Nolan",
    poster_url: "https://m.media-amazon.com/images/I/71y7D0CRZfL._AC_SY679_.jpg"
  },
  {
    title: "Parasite",
    rating: 3.6,
    director_name: "Bong Joon Ho",
    poster_url: "https://m.media-amazon.com/images/I/51vv75oglyL._AC_.jpg"
  },
  {
    title: "Whiplash",
    rating: 3.5,
    director_name: "Damien Chazelle",
    poster_url: "https://m.media-amazon.com/images/I/51-rx2NVDwL._AC_.jpg"
  },
  {
    title: "Gladiator",
    rating: 3.5,
    director_name: "Ridley Scott",
    poster_url: "https://m.media-amazon.com/images/I/51A9cFzMZXL._AC_SY679_.jpg"
  },
  {
    title: "The Green Mile",
    rating: 3.6,
    director_name: "Frank Darabont",
    poster_url: "https://m.media-amazon.com/images/I/51qMhF8KekL._AC_.jpg"
  },
  {
    title: "The Lion King",
    rating: 3.5,
    director_name: "Roger Allers, Rob Minkoff",
    poster_url: "https://m.media-amazon.com/images/I/51XzYvbxEFL._AC_.jpg"
  },
  {
    title: "The Prestige",
    rating: 3.5,
    director_name: "Christopher Nolan",
    poster_url: "https://m.media-amazon.com/images/I/51y0Q9ux3dL._AC_SY679_.jpg"
  },
  {
    title: "The Departed",
    rating: 3.5,
    director_name: "Martin Scorsese",
    poster_url: "https://m.media-amazon.com/images/I/51h4QUOSmfL._AC_.jpg"
  },
  {
    title: "Joker",
    rating: 3.4,
    director_name: "Todd Phillips",
    poster_url: "https://m.media-amazon.com/images/I/71CfxRXc8NL._AC_SY679_.jpg"
  }
]

puts "Seeding movies..."

movies_data.each do |movie_data|
  file = URI.open(movie_data[:poster_url])
  movie = Movie.new(
    title: movie_data[:title],
    rating: movie_data[:rating],
    director_name: movie_data[:director_name]
  )
  movie.poster.attach(
    io: file,
    filename: File.basename(URI.parse(movie_data[:poster_url]).path),
    content_type: "image/jpeg"
  )
  movie.save!
  puts "Created #{movie.title}"
end

puts "Seeding completed!"
