function fn() {
  var config = {
    env: karate.env || 'local',
    baseUrl: 'https://www.saucedemo.com'
  };

  // Configuración mejorada del driver
  karate.configure('driver', { 
    type: 'chrome',
    showDriverLog: true,  // ← Ver logs para debugging
    headless: false,      // ← Cambiar a false para ver el navegador
    timeout: 30000,       // ← Aumentar timeout a 30 segundos
    start: {
      windowSize: [1920, 1080]  // ← Tamaño de ventana
    },
    webDriverSession: {
      desiredCapabilities: {
        'goog:chromeOptions': {
          args: [
            '--no-sandbox',
            '--disable-dev-shm-usage',
            '--disable-gpu',
            '--disable-extensions',
            '--disable-software-rasterizer'
          ]
        }
      }
    }
  });

  // Timeouts más largos
  karate.configure('retry', { count: 3, interval: 2000 });
  karate.configure('connectTimeout', 30000);
  karate.configure('readTimeout', 30000);

  return config;
}


