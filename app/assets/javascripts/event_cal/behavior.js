(function($) {
  var behaviors = {};
  $.fn.behavior = function() {
    $('[data-behavior]', this).add(this).each(function() {
      var el = this,
      assignedBehaviors = ($(this).data('behavior') || "").split(' ');
      $.each(assignedBehaviors, function(index, assignedBehavior) {
        if (!assignedBehavior) { return };
        if (!behaviors[assignedBehavior]) {
          throw "Behavior '" + assignedBehavior + "' is not defined";
        }
        behaviors[assignedBehavior].call(el);
      });
    });
  }
  $.behavior = {
    add: function(name, callback) {
      behaviors[name] = callback;
    }
  }

}(jQuery));
