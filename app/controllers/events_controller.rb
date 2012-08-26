class EventsController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        render :json => EventSource.upcoming
      end
    end
  end
end
