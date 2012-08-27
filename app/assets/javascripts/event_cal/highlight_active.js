(function($) {
  $.behavior.add('highlight_active', function() {
    var container = $(this);
    container.click(function(e) {
      e.preventDefault();
      $('li', container).removeClass('active');
      $(e.target).parent('li').addClass('active');
    });
  });
}(jQuery));

