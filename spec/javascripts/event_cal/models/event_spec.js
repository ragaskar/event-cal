describe("Event", function() {
  it("has appropriate getters", function() {
    var event = new EventCal.Models.Event({
      name: "Event Title",
      price: "10.00",
      description: "Description",
      venue: {
        name: 'Event Venue',
        address: "Event Address"
      }
    });
    expect(event.name).toBe("Event Title");
    expect(event.venueName).toBe("Event Venue");
    expect(event.venueAddress).toBe("Event Address");
    expect(event.description).toBe("Description");
    expect(event.price).toBe("10.00");
    expect(event.priceClass).toBe("cheap");
  });
});
