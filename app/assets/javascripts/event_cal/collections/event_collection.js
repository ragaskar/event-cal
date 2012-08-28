EventCal.Collections.EventCollection = function(options) {
  var self = new (Backbone.Collection.extend({
    model: EventCal.Models.Event,
    url: "/events.json"
  }))(options);
  return self;
};
