# Progreso del Proyecto: AlKambio Flutter

## Objetivo del Proyecto
Replicar la aplicación "Al Cambio" como una aplicación Flutter de código abierto, sin publicidad y con un enfoque en la privacidad del usuario. La aplicación original está construida con React Native.

## Estado Actual
Se ha iniciado la creación del proyecto `alkambio_flutter`.

### Estructura de Archivos Creada:
- Directorio raíz: `alkambio_flutter`
- `pubspec.yaml`: Configurado con las dependencias iniciales (`flutter_bloc`, `http`, `equatable`, `get_it`, `injectable`, `intl`).
- `lib/main.dart`: Punto de entrada de la aplicación.
- `lib/src/app.dart`: Contiene el widget `MaterialApp` principal.
- Directorios de Clean Architecture dentro de `lib/src`:
    - `config`
    - `core`
    - `features`

## Próximos Pasos
1.  **Crear la estructura de directorios de Android** y un `AndroidManifest.xml` mínimo.
2.  **Crear el workflow de GitHub Actions** para la compilación del APK/AAB.
3.  **Implementar la funcionalidad de la API**: Modelos de datos, servicio de API y lógica de negocio (BLoC).
4.  **Desarrollar la interfaz de usuario** para mostrar las tasas de cambio y la calculadora.
5.  **Implementar la calculadora de divisas**.
6.  **Integrar la navegación** entre las diferentes pantallas.
