function fn() {
  var locators = read('classpath:ui/locators/login.json');

  return {
    assertWelcome: function() {
      driver.waitFor(locators.inventoryContainer);
    }
  };
}


