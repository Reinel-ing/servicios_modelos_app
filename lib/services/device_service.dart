import 'package:sensors_plus/sensors_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';

class DeviceService {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  final Connectivity _connectivity = Connectivity();

  Future<Map<String, String>> getDeviceInfo() async {
    try {
      final android = await _deviceInfo.androidInfo;
      return {
        'model': android.model ?? 'Unknown',
        'manufacturer': android.manufacturer ?? 'Unknown',
        'version': android.version.release ?? 'Unknown',
      };
    } catch (e) {
      return {'error': 'Error'};
    }
  }

  Future<String> getConnectivityStatus() async {
    final result = await _connectivity.checkConnectivity();
    if (result.contains(ConnectivityResult.mobile)) return 'Mobile';
    if (result.contains(ConnectivityResult.wifi)) return 'WiFi';
    if (result.contains(ConnectivityResult.ethernet)) return 'Ethernet';
    return 'No connection';
  }

  Stream<String> get connectivityStream => _connectivity.onConnectivityChanged
      .asyncMap((_) async => await getConnectivityStatus());

  Future<Map<String, double>> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) throw Exception('Location service disabled');

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) throw Exception('Permission denied');
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      return {
        'latitude': position.latitude,
        'longitude': position.longitude,
        'accuracy': position.accuracy,
      };
    } catch (e) {
      return {'error': 1.0};
    }
  }

  Stream<Map<String, double>> getLocationStream() {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).map((Position p) => {
      'latitude': p.latitude,
      'longitude': p.longitude,
      'accuracy': p.accuracy,
    });
  }
}
