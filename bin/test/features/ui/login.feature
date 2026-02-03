Feature: Login UI - Swag Labs

  Background:
    # Cargar datos
    * def users = read('classpath:ui/data/users.json')
    
    # Obtener timestamp
    * def obtenerTimestamp = 
    """
    function() {
      var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
      var Date = Java.type('java.util.Date');
      var formato = new SimpleDateFormat('yyyy-MM-dd_HH-mm-ss');
      return formato.format(new Date());
    }
    """
    
    # Crear carpeta con timestamp
    * def timestamp = obtenerTimestamp()
    * def crearCarpeta = 
    """
    function(nombre) {
      try {
        var File = Java.type('java.io.File');
        var ruta = 'target/screenshots/' + nombre + '/' + timestamp;
        var carpeta = new File(ruta);
        if (!carpeta.exists()) {
          var creada = carpeta.mkdirs();
          if (creada) {
            karate.log('✅ Carpeta creada:', ruta);
          } else {
            karate.log('⚠️ No se pudo crear carpeta:', ruta);
          }
        }
        return ruta;
      } catch(e) {
        karate.log('❌ Error:', e.message);
        return 'target/screenshots';
      }
    }
    """
    
    * def carpetaBase = crearCarpeta('login')
    
    # Función para capturar
    * def capturar = 
    """
    function(nombre) {
      try {
        var ruta = carpetaBase + '/' + nombre + '.png';
        karate.call('screenshot "' + ruta + '"');
        karate.log('📸 Screenshot:', ruta);
      } catch(e) {
        karate.log('⚠️ Error en screenshot:', e.message);
      }
    }
    """

  @smoke
  Scenario: Login exitoso
    # Iniciar driver con retry
    * configure retry = { count: 3, interval: 2000 }
    Given driver 'https://www.saucedemo.com'
    And waitForUrl('https://www.saucedemo.com/')
    And waitFor('#login_button_container')
    * capturar('01-inicio')
    
    # Llenar formulario
    When input('#user-name', users.valid.username)
    And input('#password', users.valid.password)
    * capturar('02-formulario-llenado')
    
    # Click y esperar
    And click('#login-button')
    And waitForUrl('https://www.saucedemo.com/inventory.html')
    And waitFor('.title')
    * capturar('03-home-cargado')
    
    # Verificar
    Then match text('.title') == 'Products'
    And match driver.url == 'https://www.saucedemo.com/inventory.html'

  @negative
  Scenario: Login fallido
    Given driver 'https://www.saucedemo.com'
    And waitFor('#login_button_container')
    * capturar('01-inicio')
    
    When input('#user-name', users.invalid.username)
    And input('#password', users.invalid.password)
    * capturar('02-datos-invalidos')
    
    And click('#login-button')
    And waitFor('h3[data-test="error"]')
    * capturar('03-error-mostrado')
    
    Then match text('h3[data-test="error"]') contains 'do not match'
