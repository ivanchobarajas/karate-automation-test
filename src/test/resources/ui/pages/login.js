function fn() {
  var locators = read('classpath:ui/locators/login.json');

  return {
    open: function() {
      // Usamos directamente la URL base de la página (Swag Labs)
      driver.get('https://www.saucedemo.com'); 
    },
    login: function(payload) {
      driver.input(locators.username, payload.username);
      driver.input(locators.password, payload.password);
      driver.click(locators.submit);
    }
  };
}