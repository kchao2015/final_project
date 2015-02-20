# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Deletes everything from the database so that you start fresh
puts "Deleting all records from the database..."
Item.delete_all
Country.delete_all
City.delete_all
Trip.delete_all
Pack.delete_all
User.delete_all

# Create the seasons
puts "Creating seasons..."
spring = Season.create(name: "Spring")
summer = Season.create(name: "Summer")
fall = Season.create(name: "Fall")
winter = Season.create(name: "Winter")
all = Season.create(name: "All")

# Create the categories
puts "Creating categories..."
clothing = Category.create(name: "Clothing")
toiletries = Category.create(name: "Toiletries")
accessories = Category.create(name: "Accessories")
electronics = Category.create(name: "Electronics")
documents = Category.create(name: "Documents")
food = Category.create(name: "Food")

# Create the Items
puts "Creating items..."
casual_shirt = Item.create(name: "Casual shirt", category_id: clothing.id, season_id: all.id)
dress_shirt = Item.create(name: "Dress shirt", category_id: clothing.id, season_id: all.id)
hat = Item.create(name: "Hat", category_id: accessories.id, season_id: summer.id)
toothbrush = Item.create(name: "Toothbrush", category_id: toiletries.id, season_id: all.id)
deodorant = Item.create(name: "Deodorant", category_id: toiletries.id, season_id: all.id)

# Create the Countries
puts "Creating countries..."
usa = Country.create(name: "United States")
france = Country.create(name: "France")
spain = Country.create(name: "Spain")
canada = Country.create(name: "Canada")
mexico = Country.create(name: "Mexico")

# Create the Cities
puts "Creating cities..."
san_francisco = City.create(name: "San Francisco", country_id: usa.id)
new_york_city = City.create(name: "New York City", country_id: usa.id)
paris = City.create(name: "Paris", country_id: france.id)
barcelona = City.create(name: "Barcelona", country_id: spain.id)
las_vegas = City.create(name: "Las Vegas", country_id: usa.id)

# Create the Users
puts "Creating users..."
kevin = User.create(name: "kevin", email: "kevin@gmail.com", password: "asdf")
lucy = User.create(name: "lucy", email: "lucy@gmail.com", password: "fdsa")
khorshid = User.create(name: "khorshid", email: "khorshid@gmail.com", password: "qwer")
brian = User.create(name: "brian", email: "brian@gmail.com", password: "rewq")
jeff = User.create(name: "jeff", email: "jeff@gmail.com", password: "zxcv")

# Create the Trips
puts "Creating trips..."
i_love_sf = Trip.create(name: "I love sf", city_id: san_francisco.id, duration: "10", season_id: spring.id )
nyc = Trip.create(name: "Nyc", city_id: new_york_city.id, duration: "10", season_id: spring.id )
paris_with_love = Trip.create(name: "Paris with love", city_id: paris.id, duration: "10", season_id: fall.id )
barcelona_finally = Trip.create(name: "Barcelona finally", city_id: barcelona.id, duration: "10", season_id: winter.id )
sin_city = Trip.create(name: "Sin city", city_id: las_vegas.id, duration: "10", season_id: summer.id )

# Create the trip/city location pairings
puts "Creating Locations..."
Location.create(trip_id: i_love_sf.id, city_id: san_francisco.id)
Location.create(trip_id: nyc.id, city_id: new_york_city.id)
Location.create(trip_id: paris_with_love.id, city_id: paris.id)
Location.create(trip_id: barcelona_finally.id, city_id: barcelona.id)
Location.create(trip_id: sin_city.id, city_id: las_vegas.id)

# Create the packing items for i_love_sf
puts "Creating Packs..."
Pack.create(item_id: dress_shirt.id, trip_id: i_love_sf.id, quantity: "10")
Pack.create(item_id: toothbrush.id, trip_id: i_love_sf.id, quantity: "1")
Pack.create(item_id: deodorant.id, trip_id: i_love_sf.id, quantity: "1")

puts "There are now #{Item.count} items, #{City.count} cities, and #{Trip.count} trips in the database."