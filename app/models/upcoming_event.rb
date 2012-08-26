class UpcomingEvent
  def initialize(event)
    @event = event
  end

  def ==(other)
    other.has_same_event(@event)
  end

  def has_same_event(event)
    @event == event
  end

  def as_json(options = nil)
    @event.as_json(include: :venue)
  end

end
