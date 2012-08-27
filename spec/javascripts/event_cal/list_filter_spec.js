describe("list_filter", function() {
  it("hides all elements without the specified class when the corresponding link is clicked", function() {
    var container = $('<div></div>'),
    navigation = $('<div data-behavior="list_filter" data-content-to-filter=".content">' +
                   '<a id="foo" data-list-filter-show=".foo"></a>' +
                   '<a id="bar" data-list-filter-show=".bar"></a>' +
                   '<a id="baz" data-list-filter-show=".foo .bar"></a>' +
                   '</div>'),
    list = $("<ul class='content'><li class='foo'></li><li class='bar'></li></ul>")
    container.append(navigation);
    container.append(list);
    this.fixture().append(container);

    container.behavior();

    expect($('.foo', container)).toBeVisible();
    expect($('.bar', container)).toBeVisible();

    $('a#foo', navigation).click();

    expect($('.foo', container)).toBeVisible();
    expect($('.bar', container)).not.toBeVisible();

    $('a#bar', navigation).click();

    expect($('.foo', container)).not.toBeVisible();
    expect($('.bar', container)).toBeVisible();

    $('a#baz', navigation).click();

    expect($('.foo', container)).toBeVisible();
    expect($('.bar', container)).toBeVisible();
  });
});
