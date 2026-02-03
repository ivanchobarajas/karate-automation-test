# Esquema de automatización web con Karate

Este repositorio contiene un esquema base para automatizar una página web usando Karate UI (Playwright embebido). El objetivo es proporcionar una estructura clara para features, páginas, datos y utilidades.

## Estructura de carpetas

```
src/
  test/
    java/
      automation/
        RunnerTest.java
    resources/
      karate-config.js
      features/
        ui/
          login.feature
      ui/
        data/
          users.json
        locators/
          login.json
        pages/
          login.js
          home.js
        utilities/
          ui-helpers.js
reports/
  (salida de reportes)
docs/
  (documentación adicional)
```

## Cómo ejecutar

```bash
./gradlew test
```

## Notas
- La configuración principal está en `karate-config.js`.
- Los selectores se centralizan en `src/test/resources/ui/locators`.
- Las páginas (page objects) se alojan en `src/test/resources/ui/pages`.
- Los datos de prueba viven en `src/test/resources/ui/data`.
- El runner usa TestNG con `karate-testng`.
