# Resumen del Progreso del Proyecto AlKambio Flutter

Este documento resume las tareas completadas y las decisiones tomadas durante el desarrollo del proyecto AlKambio Flutter.

## 1. Configuración Inicial y Arquitectura

*   **Verificación de la estructura del proyecto**: Se confirmó la estructura inicial del proyecto `alkambio_flutter`, incluyendo `pubspec.yaml`, `lib/main.dart` y `lib/src/app.dart`.
*   **Estructura de Clean Architecture**: Se crearon los directorios `config`, `core` y `features` dentro de `lib/src`, y se estableció la estructura de capas (`data`, `domain`, `presentation`) para la feature `exchange_rates`.

## 2. Integración Continua (CI/CD)

*   **Workflow de GitHub Actions**: Se creó el archivo `.github/workflows/build.yml` para automatizar la compilación del APK de Android.
    *   Se incluyeron pasos para configurar Java y Flutter, restaurar archivos de plataforma (`flutter create .`), obtener dependencias y construir el APK.
    *   **Resolución de errores**: Se actualizó `actions/upload-artifact` de `v3` a `v4` y la versión de Java de `11` a `17` para cumplir con los requisitos de Gradle.

## 3. Implementación de la Funcionalidad de la API (Clean Architecture)

*   **Identificación de la API**: Se analizó `Api.py` y `response.json` para identificar el endpoint GraphQL (`https://api.alcambio.app/graphql`) y la consulta `getCountryConversions`.
*   **Modelos de Datos**: Se crearon los modelos Dart (`CurrencyModel`, `ConversionRateModel`, `CountryModel`, `CountryConversionModel`) en `lib/src/features/exchange_rates/data/models/` utilizando `json_serializable` y `equatable`.
*   **DataSource**: Se implementó `ExchangeRateRemoteDataSource` para realizar la llamada a la API.
*   **Entidades de Dominio**: Se definieron las entidades puras (`Currency`, `ConversionRate`, `CountryConversion`) en `lib/src/features/exchange_rates/domain/entities/`.
*   **Repositorio**: Se creó la interfaz `ExchangeRateRepository` y su implementación `ExchangeRateRepositoryImpl` para abstraer el acceso a los datos y mapear modelos a entidades.
*   **UseCase**: Se implementó `GetCountryConversions` en `lib/src/features/exchange_rates/domain/usecases/` para la lógica de negocio.
*   **BLoC de Tasas de Cambio**: Se creó `ExchangeRateBloc` en `lib/src/features/exchange_rates/presentation/bloc/` para gestionar el estado de la UI.

## 4. Inyección de Dependencias

*   **Configuración de `get_it` e `injectable`**: Se configuró `injection_container.dart` para registrar automáticamente las dependencias (`DataSource`, `Repository`, `UseCase`, `Bloc`, `http.Client`, `SharedPreferences`).
*   **Generación de código**: Se ejecutó `build_runner` para generar los archivos necesarios para la inyección de dependencias.

## 5. Desarrollo de la Interfaz de Usuario (UI)

*   **Página Principal (`ExchangeRatePage`)**: Se configuró como la pantalla de inicio, mostrando las tasas de cambio y un campo de entrada para la calculadora.
*   **Widget `RateListItem`**: Creado para mostrar cada tasa de cambio individualmente.
*   **Página "Acerca de" (`AboutPage`)**: Implementada para mostrar información de la aplicación (nombre, desarrollador "billy", versión, licencia de software libre). Se añadió `package_info_plus` para obtener la versión.
*   **Página de Historial (`HistoryPage`)**: Implementada para mostrar el historial de cálculos.

## 6. Implementación de la Calculadora de Divisas

*   **`CalculatorBloc`**: Creado para gestionar la lógica de cálculo de divisas.
*   **Integración en `ExchangeRatePage`**: El `TextField` de la página principal envía eventos al `CalculatorBloc` para realizar cálculos.
*   **Actualización de `RateListItem`**: Muestra los valores calculados dinámicamente.

## 7. Persistencia del Historial

*   **Decisión de Tecnología**: Se optó por `shared_preferences` debido a conflictos de dependencias con `hive_generator`.
*   **Modelo `CalculationHistory`**: Recreado con métodos `toJson` y `fromJson` para serialización manual.
*   **`HistoryRepository`**: Implementado utilizando `shared_preferences` para guardar y recuperar el historial de cálculos.
*   **Integración con `CalculatorBloc`**: Cada cálculo se guarda automáticamente en el historial.
*   **`HistoryBloc`**: Creado para gestionar el estado de la `HistoryPage` y cargar el historial.
*   **Actualización de `HistoryPage`**: Muestra el historial de cálculos guardado.

## 8. Resolución de Dependencias

*   Se realizaron múltiples iteraciones para resolver conflictos de versiones entre `build_runner`, `json_serializable`, `injectable_generator` y `source_gen`, actualizando las versiones de los paquetes en `pubspec.yaml` hasta lograr una configuración compatible.
