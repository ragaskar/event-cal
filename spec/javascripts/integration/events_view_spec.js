describe("events view", function() {
  it("should show events and allow you to filter them", function() {
    var container = $('<div id="content">'),
    events = [{
      name: "Vintage Enthusiasts Air Show",
      price: "6.0",
    },
    {
      name: "Indie Triathlon",
      price: "0.0",
    },
    {
      name: "Punk Rock Slam Dunk Contest",
      price: "16.0",
    }]

    spyOn($, 'ajax');

    $('#jasmine_content').append(container);

    EventCal.boot(container);

    expect($.ajax).toHaveBeenCalled();
    expect($.ajax.mostRecentCall.args[0].url).toBe('/events.json');
    $.ajax.mostRecentCall.args[0].success(events);

    expect($('li.event:visible', container).length).toBe(3);
    expect($('li.event:eq(0)', container).text()).toMatch('Vintage Enthusiasts Air Show');
    expect($('li.event:eq(1)', container).text()).toMatch('Indie Triathlon');
    expect($('li.event:eq(2)', container).text()).toMatch('Punk Rock Slam Dunk Contest');

    $('a.show-cheap', container).click();
    expect($('li.event:visible', container).length).toBe(2);

    $('a.show-free', container).click();
    expect($('li.event:visible', container).length).toBe(1);
  });
});
