beforeEach(function() {
  this.fixture = function() {
    return $('#jasmine_content');
  }
});

afterEach(function() {
  this.fixture().empty();
});
