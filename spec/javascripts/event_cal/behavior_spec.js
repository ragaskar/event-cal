describe("behavior", function() {
  it("should apply the correct behavior to each element in the passed container", function() {
    var fooClickSpy = jasmine.createSpy("foo click"),
    barClickSpy = jasmine.createSpy("bar click"),
    container = $("<div><div id='foo' data-behavior='foo'></div><div id='bar' data-behavior='bar'></div></div>");

    $.behavior.add('foo', function() {
      $(this).click(fooClickSpy);
    });
    $.behavior.add('bar', function() {
      $(this).click(barClickSpy);
    });

    $('#foo', container).click();
    expect(fooClickSpy).not.toHaveBeenCalled();

    $('#bar', container).click();
    expect(barClickSpy).not.toHaveBeenCalled();

    container.behavior();

    $('#foo', container).click();
    expect(fooClickSpy).toHaveBeenCalled();

    $('#bar', container).click();
    expect(barClickSpy).toHaveBeenCalled();
  });

  it("works correctly with multiple behaviors", function() {
    var fooClickSpy = jasmine.createSpy("foo click"),
    barClickSpy = jasmine.createSpy("bar click"),
    container = $("<div><div id='foo' data-behavior='foo bar'></div></div>");

    $.behavior.add('foo', function() {
      $(this).click(fooClickSpy);
    });
    $.behavior.add('bar', function() {
      $(this).click(barClickSpy);
    });

    $('#foo', container).click();
    expect(fooClickSpy).not.toHaveBeenCalled();

    container.behavior();

    $('#foo', container).click();
    expect(fooClickSpy).toHaveBeenCalled();
    expect(barClickSpy).toHaveBeenCalled();
  });

  it("works at top level", function() {
    var fooClickSpy = jasmine.createSpy("foo click"),
    barClickSpy = jasmine.createSpy("bar click"),
    container = $("<div id='foo' data-behavior='foo'></div>");

    $.behavior.add('foo', function() {
      $(this).click(fooClickSpy);
    });

    container.behavior();

    container.click();
    expect(fooClickSpy).toHaveBeenCalled();
  });

  it("raises on undefined behaviors", function() {
    var container = $("<div><div data-behavior='baz'></div></div>");

    expect(function() {
      container.behavior();
    }).toThrow("Behavior 'baz' is not defined");

  });
});
