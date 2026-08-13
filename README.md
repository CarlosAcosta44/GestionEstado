# Gestión de Estado con GetIt & WatchIt (Equipo 8)

Proyecto pedagógico desarrollado en **Flutter** para la actividad sobre **Manejo de Estado con terceros**.

**Integrantes del Equipo 8:**
- Dany Sebastian
- Brayan David
- Carlos Mario

---

## 📚 Respuestas a las Preguntas de la Actividad

### 1. ¿Qué es GetIt y WatchIt?
* **GetIt:** Es un **Service Locator** (localizador de servicios) para Dart y Flutter. Funciona como un directorio o registro central donde se guardan instancias de clases (servicios, controladores, estados) para acceder a ellas desde cualquier parte de la aplicación **sin depender del `BuildContext`**.
* **WatchIt:** Es un paquete que extiende GetIt en Flutter. Permite que los Widgets escuchen cambios en los objetos registrados en GetIt (como clases que extienden `ChangeNotifier` o `ValueNotifier`) y se redibujen automáticamente de forma **reactiva**.

### 2. ¿Para qué se usa?
* Para desacoplar la lógica de negocio y el estado global de la interfaz de usuario (UI).
* Para evitar el problema de "Prop Drilling" (pasar variables manualmente por el constructor a través de muchos widgets).
* Para acceder a servicios y estados compartidos de forma rápida, eficiente y directa.

### 3. Ventajas y Desventajas

#### ✅ Ventajas:
* **Fácil de entender e implementar:** No requiere complejos boilerplate como otros patrones.
* **Independencia del `BuildContext`:** Se puede acceder al estado o servicios fuera del árbol de widgets.
* **Excelente rendimiento:** `WatchIt` solo redibuja el widget que está escuchando cuando el estado notifica un cambio.
* **Inyección de dependencias limpia:** Facilita la creación de Singletons o Factory instances.

#### ❌ Desventajas:
* **Alcance Global (Global Scope):** Si no se gestiona bien, cualquier parte de la app puede modificar el estado.
* **Falta de compilación estricta en el árbol:** A diferencia de `Provider`, GetIt es un registro global en memoria, por lo que si solicitas un tipo no registrado, la falla ocurre en tiempo de ejecución.

### 4. Otras Consideraciones
* Es ideal combinar **GetIt** (para localizar la instancia) + **WatchIt** (para la reactividad visual).
* En aplicaciones medianas y grandes, facilita enormemente las pruebas unitarias (Testing/Mocking), ya que se pueden reemplazar las dependencias registradas en GetIt por Mocks.

---

## 🚀 Estructura de las 4 Pantallas Exigidas

La aplicación cumple estrictamente con el requerimiento de **4 pantallas simples y concretas (sin APIs ni bases de datos)**:

1. **`Home /` (Pantalla de Inicio):**
   * Muestra el resumen del estado global del aprendiz, participaciones y módulo activo en tiempo real mediante `WatchIt`.
   * Permite la navegación hacia P1, P2 y P3.

2. **`P1` (Modificar Estado Global y Paso Directo):**
   * Demuestra cómo escribir en el estado global usando `getIt<AppState>().actualizarNombre()`.
   * Demuestra el **paso directo de datos entre pantallas por constructor** (de P1 a P2).

3. **`P2` (Reactividad e Interacción):**
   * Recibe y muestra parámetros enviados por constructor/ruta desde P1 o Home.
   * Demuestra **reactividad en la misma pantalla** modificando las participaciones y cambiando el módulo activo, viendo cómo la UI se redibuja en vivo gracias a `WatchingWidget` y `watchIt<AppState>()`.

4. **`P3` (Resumen y Control Global):**
   * Consolida la información compartida a lo largo de todo el árbol de widgets.
   * Ofrece un botón para **reiniciar todo el estado global** a sus valores iniciales y retornar a la pantalla de inicio.

---

## 🛠️ Cómo Ejecutar el Proyecto

1. Asegúrate de tener instalado Flutter.
2. Ejecuta en la terminal:
   ```bash
   flutter pub get
   flutter run
   ```
