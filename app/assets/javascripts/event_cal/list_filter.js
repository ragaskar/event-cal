(function($) {
  $.behavior.add('list_filter', function() {
    var container = $(this),
    list = $(container.data("contentToFilter"), document),
    selectorsToFilter,
    filters;

    filters = $('[data-list-filter-show]', container);
    selectorsToFilter = allSelectorsToFilter(filters);

    filters.click(function(e) {
      var selectorsToShow = $(e.target).data("listFilterShow").split(' ');
      $(selectorsToFilter.join(', '), list).hide();
      $(selectorsToShow.join(', '), list).show();
    });

  });

  function allSelectorsToFilter(filters) {
    var selectorHash = {}, allSelectors = [];
    filters.each(function() {
      var selectors = $(this).data('listFilterShow').split(' ');
      $.each(selectors, function(i, klass) {
        selectorHash[klass] = true;
      });
    });
    $.each(selectorHash, function(key, val) {
      allSelectors.push(key);
    });
    return allSelectors;
  };
}(jQuery));


