import 'package:flutter/foundation.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:servicios_modelos_app/services/device_service.dart';
import 'dart:async';

class DeviceDataProvider extends ChangeNotifier {
  final DeviceService _deviceService = DeviceService();
  
  AccelerometerEvent? _accelerometer;
  GyroscopeEvent? _gyroscope;
  MagnetometerEvent? _magnetometer;
  Map<String, String> _deviceInfo = {};
  int _batteryLevel = 100;
  String _connectivity = 'Unknown';
  Map<String, double> _location = {};
  
  StreamSubscription? _accelSub;
  StreamSubscription? _gyroSub;
  StreamSubscription? _magSub;
  StreamSubscription? _connectSub;
  StreamSubscription? _locSub;

  AccelerometerEvent? get accelerometer => _accelerometer;
  GyroscopeEvent? get gyroscope => _gyroscope;
  MagnetometerEvent? get magnetometer => _magnetometer;
  Map<String, String> get deviceInfo => _deviceInfo;
  int get batteryLevel => _batteryLevel;
  String get connectivity => _connectivity;
  Map<String, double> get location => _location;

  DeviceDataProvider() {
    _init();
  }

  Future<void> _init() async {
    _deviceInfo = await _deviceService.getDeviceInfo();
    _connectivity = await _deviceService.getConnectivityStatus();
    try {
      _location = await _deviceService.getCurrentLocation();
    } catch (e) {
      _location = {'error': 1.0};
    }
    notifyListeners();
    _startStreams();
  }

  void _startStreams() {
    _accelSub = accelerometerEvents.listen((e) {
      _accelerometer = e;
      notifyListeners();
    });

    _gyroSub = gyroscopeEvents.listen((e) {
      _gyroscope = e;
      notifyListeners();
    });

    _magSub = magnetometerEvents.listen((e) {
      _magnetometer = e;
      notifyListeners();
    });

    _connectSub = _deviceService.connectivityStream.listen((status) {
      _connectivity = status;
      notifyListeners();
    });

    _locSub = _deviceService.getLocationStream().listen((loc) {
      _location = loc;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _accelSub?.cancel();
    _gyroSub?.cancel();
    _magSub?.cancel();
    _connectSub?.cancel();
    _locSub?.cancel();
    super.dispose();
  }
}
