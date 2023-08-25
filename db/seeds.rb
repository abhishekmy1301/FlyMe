# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Cleaning database..."

Booking.destroy_all
Aircraft.destroy_all
User.destroy_all

puts "Creating users"

# create 2 users
user1 = User.new(
  email: "billgate@outlook.com",
  password: "123456"
)

user2 = User.new(
  email: "kloekardashian@gmail.com",
  password: "654321"
)

user3 = User.new(
  email: "elonmusk@x.com",
  password: "123456"
)

user1.save
user2.save

puts user1.email
puts user2.email


puts "Creating aircrafts"

aircraft1 = Aircraft.create!(
  model: 'Gulfstream G550',
  description: "The G550 is a jet focused on reliability and uncompromising performance. It has an impressive intercontinental range of almost 10,850 kilometres and a high passenger capacity. Indeed, it has a spacious and luxurious cabin that can comfortably carry 14 to 18 passengers over long distances.",
  picture_url: 'https://i0.wp.com/privatejetcardcomparisons.com/wp-content/uploads/2021/03/Gulfstream-G550-pric1e.jpg?fit=1920%2C909&ssl=1',
  capacity: 18,
  price: 10900,
  user: user1
)

aircraft2 = Aircraft.create!(
  model: 'Bombardier Global 8000',
  description: "The Bombardier Global 8000 is the worlds longest-range private jet. It has a range of 14,631 kilometres, an unrivalled record. The Global 8000 is an aircraft for faster connections. It offers the possibility to travel around the world with no or very few stopovers.",
  picture_url: 'https://businessaircraft.bombardier.com/sites/default/files/styles/retina_2700x900/public/2022-05/Global-8000-Over-Water-2085x932.jpg?itok=3iNyiSRv',
  capacity: 14,
  price: 15000,
  user: user1
)

aircraft3 = Aircraft.create!(
  model: 'Dassault Falcon 8X',
  description: "The Dassault Falcon 8X is a high-performance private jet that can travel up to 11,945 kilometers on a single tank of fuel. It is equipped with three Pratt & Whitney Canada PW307D engines, each with 6,722 pounds of thrust.",
  picture_url: 'https://images.dassault-aviation.com/f_auto,q_auto,g_center,dpr_auto/wp-auto-upload/2/files/2022/03/DA00017252_S.jpg',
  capacity: 12,
  price: 10400,
  user: user2
)

# puts "Creating bookings"

# Booking.create!(
#   departure_time: Time.new(2023,8, 24),
#   takeoff: "LHR",
#   landing: "DXB",
#   aircraft: aircraft1,
#   user: user1
# )

# Booking.create!(
#   departure_time: Time.new(2023,8, 26),
#   takeoff: "LAX",
#   landing: "JFK",
#   aircraft: aircraft2,
#   user: user2
# )

# Booking.create!(
#   departure_time: Time.new(2023,8, 30),
#   takeoff: "JFK",
#   landing: "DEN",
#   aircraft: aircraft3,
#   user: user2
# )

puts "Finished!"
