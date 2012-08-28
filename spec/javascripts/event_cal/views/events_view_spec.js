describe("EventsView", function() {
  it("should append each event to the event ul", function() {
    var collection = jasmine.createSpyObj('collection', ['each', 'on']),
    container = $('<div>'),
    content = "expected_content",
    event = {some: 'event'},
    view = new EventCal.Views.EventView({collection: collection, el: container});

    spyOn(EventCal, "Appender");
    spyOn(EventCal.Renderer, "render")

    view.render();
    expect(collection.each).toHaveBeenCalled();

    EventCal.Renderer.render.andReturn(content);

    collection.each.mostRecentCall.args[0](event);

    expect(EventCal.Renderer.render).toHaveBeenCalledWith({
      template: 'event', context: event
    });
    expect(EventCal.Appender).toHaveBeenCalledWith({
      container: container,
      tagName: 'ul',
      className: 'events unstyled',
      content: content
    })
  });

  it("should add a filter", function() {
    var collection = jasmine.createSpyObj('collection', ['each', 'on']),
    container = $('<div>'),
    content = "expected_content",
    view = new EventCal.Views.EventView({collection: collection, el: container});

    spyOn(EventCal, "Appender");
    spyOn(EventCal.Renderer, "render").andReturn(content);

    view.render();

    expect(EventCal.Renderer.render).toHaveBeenCalledWith({
      template: 'filter'
    });
    expect(EventCal.Appender).toHaveBeenCalledWith({
      container: container,
      tagName: 'ul',
      className: 'filter',
      content: content
    })
  });

  it("should apply the class of a clicked filter to the container", function() {
    var collection = jasmine.createSpyObj('collection', ['each', 'on']),
    container = $('<div>'),
    target1 = {target: $("<a class='foo'>"), preventDefault: function(){}},
    target2 = {target: $("<a class='bar'>"), preventDefault: function(){}},
    view = new EventCal.Views.EventView({collection: collection, el: container});

    view.events['click a'](target1);
    expect(container).toHaveClass('foo');

    view.events['click a'](target2);
    expect(container).toHaveClass('bar');
  });
});
