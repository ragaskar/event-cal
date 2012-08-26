require 'factory_girl'

FactoryGirl.define do
  venue_types = [
    "Speakeasy",
    "Club",
    "Abandoned Mineshaft",
    "Movie Theater",
    "Restaurant",
    "Private Home",
    "Home Depot",
    "Cow Palace",
    "Bar",
    "Beach",
    "Hotel",
    "Concert Hall",
    "Drive-Thru",
    "Crab Shak",
    "Roadhouse",
    "Automobile Dealership",
    "High School",
    "Church Basement"
  ]
  venue_adjectives = [
    "Spooky",
    "Mildly Offensive",
    "British",
    "Recently Re-opened", 
    "Repulsive",
    "Strangely Silent",
    "Five Star",
    "Critically Acclaimed",
    "Regrettable",
    "Rarely Seen",
    "Provocative",
  ]
  streets  = [
    "Howard St",
    "Mission St",
    "6th St",
    "7th St",
    "5th St",
    "Embarcadero",
    "Tehama St",
    "Powell St",
    "Geary St",
    "Folsom St",
    "Divisadero St",
    "Market St",
    "Harrison St",
    "Castro St",
    "Ellis St",
    "3rd St",
    "New Mongomery St"
  ]
  factory :venue do
    name { "#{Faker::Name.name}'s #{venue_adjectives.sample} #{venue_types.sample}"  }
    address { "#{rand(1000)} #{streets.sample}, SF, CA" }
  end
end
