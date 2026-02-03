function loginPage() {
  var locators = read('classpath:ui/locators/login.json');

  return {
    locators: locators,
    open: function(baseUrl) {
      driver(baseUrl);
    },
    headingText: function() {
      return text(locators.mainHeading);
    }
  };
}
