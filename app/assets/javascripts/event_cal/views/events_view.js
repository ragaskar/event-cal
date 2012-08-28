EventCal.Views.EventView = function(options) {
  var collection = options.collection,
  self = new (Backbone.View.extend({
    events: {
      'click a': function(e) {
        e.preventDefault();
        self.$el.attr('class', $(e.target).attr('class'));
      }
    },
    render: function() {
      EventCal.Appender({
        container: self.$el,
        tagName: 'ul',
        className: 'filter',
        content: EventCal.Renderer.render({
          template: 'filter',
        })
      });
      collection.each(renderEvent);
    }
  }))(options);
  collection.on('add', renderEvent);

  function renderEvent(event) {
    EventCal.Appender({
      container: self.$el,
      tagName: 'ul',
      className: 'events unstyled',
      content: EventCal.Renderer.render({
        template: 'event',
        context: event
      })
    });
  }
  return self;
};

