require 'acceptance_spec_helper'

describe "viewing the home page", type: :request do
  it "lets user filter events by price", js: true do
    free_event = FactoryGirl.create(:event, price: 0, name: "Free Event")
    cheap_event = FactoryGirl.create(:event, price: 9.99, name: "Cheap Event")
    expensive_event = FactoryGirl.create(:event, price: 20, name: "Expensive Event")
    visit("/")
    within('.events') do
      page.should have_css('li', :text => free_event.name, :visible => true)
      page.should have_css('li', :text => cheap_event.name, :visible => true)
      page.should have_css('li', :text => expensive_event.name, :visible => true)
    end
    click_link("Under $10")
    within('.events') do
      page.should have_css('li', :text => free_event.name, :visible => true)
      page.should have_css('li', :text => cheap_event.name, :visible => true)
      page.should_not have_css('li', :text => expensive_event.name, :visible => true)
    end
    click_link("0")
    within('.events') do
      page.should have_css('li', :text => free_event.name, :visible => true)
      page.should_not have_css('li', :text => cheap_event.name, :visible => true)
      page.should_not have_css('li', :text => expensive_event.name, :visible => true)
    end
  end
end
