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
    "Agoraphobiacs'",
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
    "Fireworks Show",
    "Dog Parade",
    "Free For All",
    "Pig-Out",
    "Cricket Match",
    "Foosball Tournament",
    "Be-In",
    "Art Opening",
    "Backyard Wrestling",
    "Fight Club",
    "Air Show",
    "Drag Race",
    "Roller Derby",
    "Rave",
    "Beer Pong Tourney",
    "Movie Marathon",
    "Magic Show",
    "Slam Dunk Contest",
    "Magic The Gathering Tournament",
  ]
  factory :event do
    name { event_genres.sample + " " + event_types.sample }
    start_time { Time.zone.now.beginning_of_day + 12.hours + rand(7).days + rand(12).hours }
    end_time { start_time + rand(11).hours }
    description { Faker::Lorem.sentences.join(' ') }
    venue
    price { rand(20) }
  end
end
