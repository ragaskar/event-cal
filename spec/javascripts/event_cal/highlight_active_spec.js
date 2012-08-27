describe("highlightActive", function() {
  it("applies the active class when an li is clicked", function() {
    var container = $("<ul data-behavior='highlight_active'>" +
                      "<li><a></a></li>" +
                      "<li><a></a></li>" +
                      "<li class='active'><a></a></li>" +
                      "</ul>");

    container.behavior();

    expect('li:eq(0)', container).not.toHaveClass('active');
    expect('li:eq(1)', container).not.toHaveClass('active');
    expect('li:eq(2)', container).not.toHaveClass('active');

    $('li:eq(0) a', container).click();
    expect($('li:eq(0)', container)).toHaveClass('active');
    expect($('li:eq(1)', container)).not.toHaveClass('active');
    expect($('li:eq(2)', container)).not.toHaveClass('active');

    $('li:eq(1) a', container).click();
    expect($('li:eq(0)', container)).not.toHaveClass('active');
    expect($('li:eq(1)', container)).toHaveClass('active');
    expect($('li:eq(2)', container)).not.toHaveClass('active');

    $('li:eq(2) a', container).click();
    expect($('li:eq(0)', container)).not.toHaveClass('active');
    expect($('li:eq(1)', container)).not.toHaveClass('active');
    expect($('li:eq(2)', container)).toHaveClass('active');
  });
});
