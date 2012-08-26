class EventSource
  def self.upcoming
    Event.all.take(10).map { |e| UpcomingEvent.new(e) }
  end
end
