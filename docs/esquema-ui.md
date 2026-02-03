# Esquema de automatización UI con Karate

## Capas propuestas

1. **Features** (`src/test/resources/features/ui`)
   - Contienen escenarios en Gherkin que describen el flujo de negocio.
2. **Pages** (`src/test/resources/ui/pages`)
   - Encapsulan acciones por pantalla usando `driver`.
3. **Locators** (`src/test/resources/ui/locators`)
   - Centralizan los selectores por pantalla.
4. **Data** (`src/test/resources/ui/data`)
   - Datos de prueba reutilizables en JSON.
5. **Utilities** (`src/test/resources/ui/utilities`)
   - Configuración del driver y helpers comunes.

## Flujo sugerido

- Los `feature` cargan data y pages.
- Las `pages` usan `locators` para interactuar.
- Las `utilities` configuran el driver (Playwright) y helpers.

## Convenciones

- Cada pantalla tiene su archivo de locators y page object.
- Los datos de prueba se separan por dominio o módulo.
- Los reportes se guardan en `reports/`.
