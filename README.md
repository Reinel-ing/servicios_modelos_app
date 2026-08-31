# E04 - Interfaz Adaptativa y Sensores

Aplicación Flutter desarrollada para el laboratorio de la Semana 4 del curso de Desarrollo Móvil. La app implementa una interfaz adaptativa que cambia su tipo de navegación según el ancho de pantalla, y accede a sensores y datos de hardware del dispositivo.

## Funcionalidades

### Interfaz adaptativa
- Pantallas angostas (menos de 600px): navegación mediante BottomNavigationBar en la parte inferior.
- Pantallas anchas (600px o más): navegación mediante NavigationRail en el costado izquierdo.
- El cambio se detecta en tiempo real usando MediaQuery, sin perder el estado de navegación entre pestañas.

### Sensores y hardware
- Acelerómetro, giroscopio y magnetómetro en tiempo real (sensors_plus).
- Información del dispositivo: modelo, fabricante y versión del sistema operativo (device_info_plus).
- Estado de conectividad (WiFi, datos móviles o sin conexión) (connectivity_plus).
- Ubicación GPS: latitud, longitud y precisión (geolocator).

## Estructura del proyecto

- lib/main.dart

- lib/theme.dart

- lib/ui/app.dart — Punto de entrada de la app (MultiProvider + MaterialApp)

- lib/providers/device_data_provider.dart — Estado global de sensores y datos del dispositivo

- lib/services/device_service.dart — Acceso a sensores, hardware, conectividad y ubicación

- lib/services/product_service.dart — Servicio de productos (plantilla base del curso)

- lib/models/product.dart — Modelo de producto (plantilla base del curso)

- lib/models/category.dart — Modelo de categoría (plantilla base del curso)

- lib/screens/main_shell.dart — Navegación adaptativa (BottomNavigationBar / NavigationRail)

- lib/screens/home_screen.dart — Panel principal con resumen del dispositivo

- lib/screens/sensors_screen.dart — Detalle de acelerómetro, giroscopio y magnetómetro

- lib/screens/device_screen.dart — Información de hardware, conectividad y ubicación
## Requisitos

Flutter SDK (canal estable). Se recomienda un emulador o dispositivo Android/iOS conectado, ya que los sensores de movimiento y la ubicación GPS no funcionan correctamente en navegador web.

## Instalación y ejecución

flutter pub get
flutter run

## Dependencias principales

provider: manejo de estado
sensors_plus: acelerómetro, giroscopio, magnetómetro
device_info_plus: información de hardware
connectivity_plus: estado de conexión de red
geolocator: ubicación GPS
http: consumo de API (servicio de productos)

## Autor

Reinel Alfaro, Ingeniería de Sistemas, Universidad Popular del Cesar (UPC)