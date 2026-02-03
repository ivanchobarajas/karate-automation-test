diff --git a/README.md b/README.md
new file mode 100644
index 0000000000000000000000000000000000000000..9e178acec6b1b20e97b20a0071c304082de6a47b
--- /dev/null
+++ b/README.md
@@ -0,0 +1,45 @@
+# Esquema de automatización web con Karate
+
+Este repositorio contiene un esquema base para automatizar una página web usando Karate UI (Playwright embebido). El objetivo es proporcionar una estructura clara para features, páginas, datos y utilidades.
+
+## Estructura de carpetas
+
+```
+src/
+  test/
+    java/
+      automation/
+        RunnerTest.java
+    resources/
+      karate-config.js
+      features/
+        ui/
+          login.feature
+      ui/
+        data/
+          users.json
+        locators/
+          login.json
+        pages/
+          login.js
+          home.js
+        utilities/
+          ui-helpers.js
+reports/
+  (salida de reportes)
+docs/
+  (documentación adicional)
+```
+
+## Cómo ejecutar
+
+```bash
+./gradlew test
+```
+
+## Notas
+- La configuración principal está en `karate-config.js`.
+- Los selectores se centralizan en `src/test/resources/ui/locators`.
+- Las páginas (page objects) se alojan en `src/test/resources/ui/pages`.
+- Los datos de prueba viven en `src/test/resources/ui/data`.
+- El runner usa TestNG con `karate-testng`.
