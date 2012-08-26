require 'acceptance_spec_helper'

describe "viewing the home page", type: :request do
  it "lets user filter events by price", js: true do
    free_event = FactoryGirl.create(:event, price: 0, name: "Free Event")
    cheap_event = FactoryGirl.create(:event, price: 9.99, name: "Cheap Event")
    expensive_event = FactoryGirl.create(:event, price: 20, name: "Expensive Event")
    visit("/")
    within('.events') do
      page.should have_content(free_event.name)
      page.should have_content(cheap_event.name)
      page.should have_content(expensive_event.name)
    end
    click_link("$")
    within('.events') do
      page.should have_content(free_event.name)
      page.should have_content(cheap_event.name)
      page.should_not have_content(expensive_event.name)
    end
    click_link("0")
    within('.events') do
      page.should have_content(free_event.name)
      page.should_not have_content(cheap_event.name)
      page.should_not have_content(expensive_event.name)
    end
  end
end
