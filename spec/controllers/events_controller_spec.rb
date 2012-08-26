require 'spec_helper'
describe EventsController do
  it "should return events in JSON format" do
    event1 = double(as_json: "event 1 json")
    event2 = double(as_json: "event 2 json")
    EventSource.should_receive(:upcoming).and_return([event1, event2])
    get :index, format: :json
    response.body.should == JSON.generate([event1.as_json, event2.as_json])
  end
end
