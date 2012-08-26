require 'spec_helper'

describe UpcomingEvent do
  it "includes venue information in JSON" do
    event = double
    event.should_receive(:as_json).with(:include => :venue).and_return('event_json')
    UpcomingEvent.new(event).as_json.should == 'event_json'
  end

  it "is equal to any other UpcomingEvent for the same event" do
    event1 = double
    event2 = double
    UpcomingEvent.new(event1).should == UpcomingEvent.new(event1)
    UpcomingEvent.new(event1).should_not == UpcomingEvent.new(event2)
    UpcomingEvent.new(event2) == UpcomingEvent.new(event2)
  end
end
