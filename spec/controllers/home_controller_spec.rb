require 'spec_helper'
describe HomeController do
  it "should assign events" do
    event1 = double(as_json: "event 1 json")
    event2 = double(as_json: "event 2 json")
    EventSource.should_receive(:upcoming).and_return([event1, event2])
    get :index
    assigns(:events).should == [event1, event2]
  end
end
