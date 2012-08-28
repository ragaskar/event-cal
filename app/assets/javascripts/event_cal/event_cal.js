var EventCal = {
  Models: {},
  Views: {},
  Collections: {},
  Renderer: {
    render: function(options) {
      return HoganTemplates[options.template].render(options.context);
    }
  },
  Appender: function(options) {
    var element = $(options.tagName + '.' + options.className.replace(" ", '.'), options.container);
    if (element.length) {
      element.append(options.content);
    } else {
      var element = $('<' + options.tagName + '>').addClass(options.className);
      element.append(options.content);
      $(options.container).append(element);
    }
  },
  boot: function(container) {
    var collection = new EventCal.Collections.EventCollection();
    var view = new EventCal.Views.EventView({collection: collection, el: container});
    collection.fetch({add: true});
    view.render();
  }
}
