require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
emails = ["filip@gmail.com", "tibo@gmail.com", "mike@gmail.com", "123@gmail.com" , "1234@gmail.com"]
cities = ["Berlin", "Hamburg", "Cologne", "Munich", "Frankfurt", "London", "Manchester", "York", "Brighton", "Oxford", "Liverpool", "Birmingham", "Roma", "Milano", "Turino", "Paris", "Marseille", "Lyon", "Nice", "Amsterdam", "Brussel", "Prague" ,"Budapest", "Stockholm", "Oslo", "Reykjavik", "Vienna", "Zurich", "Geneva", "Barcelona", "Madrid", "Malaga", "Ibiza", "Monaco", "Valencia", "Firenze", "Naples", "Lisbon", "Zadar", "Split", "Lago di Garda"]

puts "rails db:reset db:migrate"
emails.each do |email|
  user = User.new
  user.email = email
  user.password = email
  user.username = Faker::Internet.username
  p user.save
end

5.times do
  file = URI.open("https://res.cloudinary.com/dwbqvkxb8/image/upload/v1661348915/production/skoda-1203-camper-rendering_sz2apa.jpg")
  caravan = Caravan.new
  caravan.user = User.all.sample
  caravan.model = Faker::Vehicle.manufacture
  caravan.capacity = rand(1..5)
  caravan.location = cities.sample
  caravan.price = Faker::Number.number(digits: 3)
  caravan.fuelType = Caravan::FUEL_TYPES.sample
  caravan.year = rand(1980..2022)
  caravan.description = Faker::Lorem.paragraph
  caravan.photos.attach(io: file, filename: "defaultCaravan.jpg", content_type: "image/jpg")
  p caravan.save
end

5.times do
  booking = Booking.new
  booking.user = User.all.sample
  booking.caravan = Caravan.all.sample
  booking.start_date = Date.today + rand(1..60)
  booking.end_date = booking.start_date + rand(1..10)
  p booking.save
end
