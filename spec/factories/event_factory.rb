require 'factory_girl'

FactoryGirl.define do
  event_genres = [
    "Death Metal",
    "Vintage Enthusiasts'",
    "B-List Celebrity",
    "Ruby Developers'",
    "Firestation #5",
    "Live-Action-Role-Players'",
    "Russian",
    "Punk Rock",
    "Indie",
    "Post-Hipster",
    "Record Store Employee",
    "East Bay Rats'",
    "Video Store Clerks'",
    "Agroaphobiacs'",
    "A True American",
  ]
  event_types = [
    "Wine Tasting",
    "Beer Tasting",
    "Concert",
    "Rummage Sale",
    "Festival",
    "Fair",
    "Pancake Breakfast",
    "BBQ Contest",
    "Breakdance Battle",
    "Triathalon",
    "Firework Show",
    "Dog Parade",
    "Free For All",
    "Pig-Out",
    "Cricket Match",
    "Foosball Tournament",
    "Be-In",
    "Art Opening",
    "Backyard Wrestling",
    "Fight Club",
    "Flight Show",
    "Drag Race",
    "Roller Derby",
    "Rave",
    "Beer Pong Tourney",
    "Movie Marathon",
  ]
  factory :event do
    name { event_genres.sample + " " + event_types.sample }
    start_time { rand(7).days.from_now }
    description { Faker::Company.catch_phrase }
    venue
    price { rand(20) }
  end
end
