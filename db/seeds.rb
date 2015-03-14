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
Season.delete_all
Category.delete_all

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
shoes = Category.create(name: "Shoes")
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
charger = Item.create(name: "Charger", category_id: electronics.id, season_id: all.id)
jeans = Item.create(name: "Jeans", category_id: clothing.id, season_id: all.id)
toothpaste = Item.create(name: "Toothpaste", category_id: toiletries.id, season_id: all.id)
facewash = Item.create(name: "Facewash", category_id: toiletries.id, season_id: all.id)
contacts = Item.create(name: "Contacts", category_id: toiletries.id, season_id: all.id)
passport = Item.create(name: "Passport", category_id: documents.id, season_id: all.id)
dress_shoes = Item.create(name: "Dress shoes", category_id: shoes.id, season_id: all.id)
boots = Item.create(name: "Boots", category_id: shoes.id, season_id: winter.id)
clif_bar = Item.create(name: "Clif Bar", category_id: food.id, season_id: all.id)
laptop = Item.create(name: "Laptop", category_id: electronics.id, season_id: all.id)

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
kevin = User.create(name: "Kevin", email: "kevin@gmail.com", password: "kevin", admin: true)
lucy = User.create(name: "Lucy", email: "lucy@gmail.com", password: "lucy")
khorshid = User.create(name: "Khorshid", email: "khorshid@gmail.com", password: "khorshid")
brian = User.create(name: "Brian", email: "brian@gmail.com", password: "brian")
jeff = User.create(name: "Jeff", email: "jeff@gmail.com", password: "jeff")

# Create the Trips
puts "Creating trips..."
i_love_sf = Trip.create(name: "I love sf", city_id: san_francisco.id, duration: "10", season_id: spring.id, user_id: kevin.id )
nyc = Trip.create(name: "Nyc", city_id: new_york_city.id, duration: "10", season_id: spring.id, user_id: kevin.id  )
paris_with_love = Trip.create(name: "Paris with love", city_id: paris.id, duration: "10", season_id: fall.id, user_id: kevin.id )
barcelona_finally = Trip.create(name: "Barcelona finally", city_id: barcelona.id, duration: "10", season_id: winter.id, user_id: kevin.id )
sin_city = Trip.create(name: "Sin city", city_id: las_vegas.id, duration: "10", season_id: summer.id, user_id: lucy.id )

# Create the packing items for i_love_sf
puts "Creating Packs..."
Pack.create(item_id: dress_shirt.id, trip_id: i_love_sf.id, quantity: "5")
Pack.create(item_id: toothbrush.id, trip_id: i_love_sf.id, quantity: "1")
Pack.create(item_id: deodorant.id, trip_id: i_love_sf.id, quantity: "1")
Pack.create(item_id: jeans.id, trip_id: i_love_sf.id, quantity: "5")
Pack.create(item_id: laptop.id, trip_id: i_love_sf.id, quantity: "1")
Pack.create(item_id: charger.id, trip_id: i_love_sf.id, quantity: "2")
Pack.create(item_id: clif_bar.id, trip_id: i_love_sf.id, quantity: "10")
Pack.create(item_id: facewash.id, trip_id: i_love_sf.id, quantity: "1")
Pack.create(item_id: toothpaste.id, trip_id: i_love_sf.id, quantity: "1")

puts "There are now #{Item.count} items, #{City.count} cities, and #{Trip.count} trips in the database."