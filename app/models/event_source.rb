class EventSource
  def self.upcoming
    Event.
      where("start_time >= ?", Time.zone.now.beginning_of_day).
      order("start_time ASC").
      map { |e| UpcomingEvent.new(e) }
  end
end
