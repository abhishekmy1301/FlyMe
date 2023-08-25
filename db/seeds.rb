# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Cleaning database..."

Booking.destroy_all
Aircraft.destroy_all
User.destroy_all

puts "Creating users"

# create 2 users
user1 = User.new(
  email: "sam@gmail.com",
  password: "123456"
)

user2 = User.new(
  email: "abhishek@gmail.com",
  password: "123456"
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
  picture_url: 'https://backend.ainonline.com/sites/default/files/uploads/2021/07/v_g700_a_mkt_00001_web_1.jpeg',
  capacity: 18,
  price: 17900,
  user: user1
)

aircraft2 = Aircraft.create!(
  model: 'Global Express 8000',
  description: "The Bombardier Global 8000 is the worlds longest-range private jet. It has a range of 14,631 kilometres, an unrivalled record. The Global 8000 is an aircraft for faster connections. It offers the possibility to travel around the world with no or very few stopovers.",
  picture_url: 'https://privatejetcharter.com/wp-content/uploads/2020/12/alwaleed.jpg',
  capacity: 14,
  price: 15000,
  user: user2
)

aircraft3 = Aircraft.create!(
  model: 'Falcon 8X',
  description: "The Dassault Falcon 8X is a high-performance private jet that can travel up to 11,945 kilometers on a single tank of fuel. It is equipped with three Pratt & Whitney Canada PW307D engines, each with 6,722 pounds of thrust.",
  picture_url: 'https://cdn.buttercms.com/U65VzRwgRrSSvZiFmDAf',
  capacity: 12,
  price: 18400,
  user: user3
)

aircraft4 = Aircraft.create!(
  model: 'Learjet 60',
  description: "The cabin of the Learjet 60 is the biggest in the Learjet family, typically configured with one and a half cabin zones. It can operate with up to seven or eight passengers but is more usually configured for six. It is designed to have the space where it counts, offering great elbow room for seated passengers.",
  picture_url: 'https://www.aerospace-technology.com/wp-content/uploads/sites/15/2017/10/Learjet45_2.jpg',
  capacity: 8,
  price: 12000,
  user: user3
)

aircraft5 = Aircraft.create!(
  model: 'Hawker800',
  description: "When it comes to cabin comfort and space, the Hawker really is in a class of its own; with a cabin diameter of 5.26 meters, the Hawker outperforms all of its rivals with ease, allowing passengers on-board to walk through the aircraft with their head up high (Stand-up Cabin).t",
  picture_url: 'https://resources.globalair.com/images/article/Embraer_Legacy_600_now_exclusively_available_through_Vertis_Aviation_interior.jpg',
  capacity: 8,
  price: 14000,
  user: user3
)

aircraft = Aircraft.create!(
  model: 'Legacy600',
  description: "The Legacy is normally configured for 10 passengers in four standard seating options. The Embraer Legacy 600 is a business jet derivative of the Embraer ERJ 145 family of commercial jet aircraft. Legacy 600",
  picture_url: 'https://unisky.aero/upload/resize_cache/iblock/996/1000_1000_0/996c040c535a965d05749a432c2adec8.jpg',
  capacity: 13,
  price: 25000,
  user: user3
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
