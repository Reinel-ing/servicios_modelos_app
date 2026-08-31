import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicios_modelos_app/providers/device_data_provider.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Información del Dispositivo'), automaticallyImplyLeading: false),
      body: Consumer<DeviceDataProvider>(
        builder: (_, provider, __) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _infoCard('Información del Dispositivo', provider.deviceInfo, Icons.phone_android, Colors.blue),
              const SizedBox(height: 16),
              _connectCard('Conectividad', provider.connectivity),
              const SizedBox(height: 16),
              _locCard('Ubicación', provider.location),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoCard(String title, Map<String, String> info, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 28),
                const SizedBox(width: 8),
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            if (info.isNotEmpty && !info.containsKey('error'))
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Modelo: ${info['model'] ?? 'N/D'}'),
                  Text('Fabricante: ${info['manufacturer'] ?? 'N/D'}'),
                  Text('Versión: ${info['version'] ?? 'N/D'}'),
                ],
              )
            else
              const Text('Sin información disponible'),
          ],
        ),
      ),
    );
  }

  Widget _connectCard(String title, String status) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.wifi, color: Colors.blue, size: 28),
                const SizedBox(width: 8),
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            Text(status, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _locCard(String title, Map<String, double> loc) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.red, size: 28),
                const SizedBox(width: 8),
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            if (!loc.containsKey('error') && loc.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Lat: ${loc['latitude']?.toStringAsFixed(6) ?? 'N/D'}'),
                  Text('Lon: ${loc['longitude']?.toStringAsFixed(6) ?? 'N/D'}'),
                  Text('Precisión: ${loc['accuracy']?.toStringAsFixed(2) ?? 'N/D'} m'),
                ],
              )
            else
              const Text('Ubicación no disponible'),
          ],
        ),
      ),
    );
  }
}