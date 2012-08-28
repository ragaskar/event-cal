describe("renderer", function() {
  it("should correctly render templates", function() {
    var context1 = {farewell: "Goodnight", planet: "Moon"},
    context2 = {farewell: "Hasta La Vista,", planet: "Mars"},
    result1 = EventCal.Renderer.render({template: 'test_template', context: context1}),
    result2 = EventCal.Renderer.render({template: 'test_template', context: context2});
    expect(result1).toMatch("<span>Goodnight Moon!</span>");
    expect(result2).toMatch("<span>Hasta La Vista, Mars!</span>");
  });
});
