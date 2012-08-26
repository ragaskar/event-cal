task :sample_data => [:environment] do
  Event.destroy_all
  Venue.destroy_all
  FactoryGirl.find_definitions
  5.times do
    FactoryGirl.create(:event, price: 0)
  end
  20.times do
    FactoryGirl.create(:event)
  end
end
