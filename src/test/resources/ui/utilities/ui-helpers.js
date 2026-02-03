function fn() {
  var config = karate.config;

  karate.configure('driver', {
    type: 'playwright',
    headless: config.headless,
    slowMo: config.slowMo
  });

  return {
    waitForReady: function() {
      driver.waitFor('body');
    }
  };
}

