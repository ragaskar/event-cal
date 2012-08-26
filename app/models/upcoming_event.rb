class UpcomingEvent
 include ActionView::Helpers::NumberHelper
 CHEAP = "cheap"
 FREE = "free"
 OVER_TEN = "over-ten"

  def initialize(event, today = Time.zone.today)
    @event = event
    @today = today
  end

  def ==(other)
    other.has_same_event(@event)
  end

  delegate :name, :description, :venue_name, :venue_address, to: :event

  def has_same_event(event)
    @event == event
  end

  def as_json(options = nil)
    @event.as_json(include: :venue)
  end

  def price
    {
      FREE => "Free!",
      CHEAP => "Cheap! (#{drop_zeros(number_to_currency(event.price))})",
      OVER_TEN => drop_zeros(number_to_currency(event.price))
    }[price_category]
  end

  def day
    case event.start_time.to_date
    when @today
      "Today (#{event_day})"
    when @today + 1.day
      "Tomorrow (#{event_day})"
    else
      "#{event.start_time.strftime('%b %-d')} (#{event_day})"
    end
  end

  def time_info
    "#{event.start_time.strftime('%-l:%M%P')} - #{event.end_time.strftime('%-l:%M%P')}"
  end

  def price_class
    price_category
  end

  private
  def event
    @event
  end

  def event_day
    @event.start_time.strftime("%a")
  end

  def price_category
    case event.price
    when 0
      FREE
    when 0 .. 10
      CHEAP
    else
      OVER_TEN
    end
  end

  def drop_zeros(price)
    price.gsub(/\.00$/, '')
  end
end
