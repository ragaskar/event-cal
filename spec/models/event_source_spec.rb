require 'spec_helper'

describe EventSource do
  it "returns upcoming events" do
    event1 = double
    event2 = double
    Event.stub_chain(:all, :take).with(10).and_return([event1, event2])
    EventSource.upcoming.should == [UpcomingEvent.new(event1), UpcomingEvent.new(event2)]
  end
end
