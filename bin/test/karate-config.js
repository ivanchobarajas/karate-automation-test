function fn() {
  var config = {
    env: karate.env || 'local',
    baseUrl: 'https://www.saucedemo.com',
    headless: true, // Esta es solo una variable de texto/booleano
    slowMo: 0
  };

  // --- CONFIGURACIÓN DEL MOTOR DE BÚSQUEDA ---
  // Aquí es donde vinculas la variable al driver de Karate
  karate.configure('driver', { 
    type: 'chrome', 
    headless: config.headless 
  });

  karate.configure('retry', { count: 3, interval: 1000 });
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);

  return config;
}


