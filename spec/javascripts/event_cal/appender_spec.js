describe("Appender", function() {
  it("should append content to spec'd DOM", function() {
    var container = $("<div>");
    EventCal.Appender({
      container: container,
      tagName: 'p',
      className: "new",
      content: "<em id='content'>content</em>",
    });
    expect($('p.new em#content:contains("content")', container).length).toBe(1);
  });

  it("should not recreate element if already exists", function() {
    var container = $("<div>");
    EventCal.Appender({
      container: container,
      tagName: 'p',
      className: "new",
      content: "<em id='content'>content</em>"
    });
    EventCal.Appender({
      container: container,
      tagName: 'p',
      className: "new",
      content: "<span id='more'></em>"
    });
    expect($('p.new', container).length).toBe(1);
    expect($('p.new em#content', container).length).toBe(1);
    expect($('p.new span#more', container).length).toBe(1);
  });
});
