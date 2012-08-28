EventCal.Models.Event = function(options) {
  var self = new (Backbone.Model.extend({
  }))(options);
  self.__defineGetter__('name', function() {
    return self.get('name');
  });
  self.__defineGetter__('venueName', function() {
    return self.get('venue').name;
  });
  self.__defineGetter__('venueAddress', function() {
    return self.get('venue').address;
  });
  self.__defineGetter__('description', function() {
    return self.get('description');
  });
  self.__defineGetter__('price', function() {
    return self.get('price');
  });
  self.__defineGetter__('priceClass', function() {
    var price = parseFloat(self.price, 10);
    if (price === 0) {
      return 'free'
    } else if (price <= 10.0) {
      return 'cheap';
    } else {
      return 'over-ten';
    }
  });
  return self;
};
