require 'integration_spec_helper'

describe EventSource do
  it "returns upcoming events sorted by date" do
    future_event = FactoryGirl.create(:event, start_time: 1.day.from_now)
    old_event = FactoryGirl.create(:event, start_time: 1.day.ago)
    event_later_today = FactoryGirl.create(:event, start_time: Time.zone.now + 2.hours)
    event_earlier_today = FactoryGirl.create(:event, start_time: Time.zone.now - 2.hours)
    EventSource.upcoming.should == [UpcomingEvent.new(event_earlier_today), UpcomingEvent.new(event_later_today), UpcomingEvent.new(future_event)]
  end
end
