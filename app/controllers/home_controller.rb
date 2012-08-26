class HomeController < ApplicationController
  def index
    @events = EventSource.upcoming
  end
end
