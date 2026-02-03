function fn() {
  var locators = read('classpath:ui/locators/login.json');

  return {
    open: function() {
      driver.get(karate.get('baseUrl') + '/login');
    },
    login: function(payload) {
      driver.input(locators.username, payload.username);
      driver.input(locators.password, payload.password);
      driver.click(locators.submit);
    }
  };
}
