require 'spec_helper'

describe UpcomingEvent do
  describe "JSON" do
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
  describe "price" do
    it "returns Free! if the event price is 0.0" do
      UpcomingEvent.new(double('event', price: 0.0)).price.should == "Free!"
    end
    it "returns Cheap! ($price) if the event price is 10.0 and under" do
      UpcomingEvent.new(double('event', price: 0.01)).price.should == "Cheap! ($0.01)"
      UpcomingEvent.new(double('event', price: 10.00)).price.should == "Cheap! ($10)"
    end
    it "returns $price if over $10" do
      UpcomingEvent.new(double('event', price: 10.01)).price.should == "$10.01"
      UpcomingEvent.new(double('event', price: 10.5)).price.should == "$10.50"
      UpcomingEvent.new(double('event', price: 11.00)).price.should == "$11"
    end
  end

  describe "day" do
    it "returns 'Today' if the start date is today" do
      event = double('event', start_time: Time.parse("July 6, 2012"))
      UpcomingEvent.new(event, Date.parse("July 6, 2012")).day.should == "Today (Fri)"
    end
    it "returns 'Tomorrow' if the start date is tomorrow" do
      event = double('event', start_time: Time.parse("July 7, 2012"))
      UpcomingEvent.new(event, Date.parse("July 6, 2012")).day.should == "Tomorrow (Sat)"
    end
    it "returns the date if the the start date is later than tomorrow" do
      event = double('event', start_time: Time.parse("July 8, 2012"))
      UpcomingEvent.new(event, Date.parse("July 6, 2012")).day.should == "Jul 8 (Sun)"
    end
  end

  describe "price_class" do
    it "returns free if the event price is 0.0" do
      UpcomingEvent.new(double('event', price: 0.0)).price_class.should == "free"
    end
    it "returns cheap if the event price is 10.0 and under" do
      UpcomingEvent.new(double('event', price: 0.01)).price_class.should == "cheap"
      UpcomingEvent.new(double('event', price: 10.00)).price_class.should == "cheap"
    end
    it "returns $price if over $10" do
      UpcomingEvent.new(double('event', price: 10.01)).price_class.should == "over-ten"
    end
  end

  it "returns the venue name" do
    UpcomingEvent.new(double('event', venue_name: "Foo")).venue_name.should == "Foo"
  end

  it "returns the venue address" do
    UpcomingEvent.new(double('event', venue_address: "Foo")).venue_address.should == "Foo"
  end

  it "returns the start/end time" do
    start_time = Time.parse("July 6, 2012 17:30")
    end_time = Time.parse("July 7, 2012 01:00")
    UpcomingEvent.new(double('event', start_time: start_time, end_time: end_time)).time_info.should == "5:30pm - 1:00am"
  end
end
